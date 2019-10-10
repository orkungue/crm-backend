  #@author Orkun Günes
class ApplicationController < ActionController::API
#  before_action :configure_permitted_parameters, if: :devise_controller?
#  include DeviseTokenAuth::Concerns::SetUserByToken
  include ApplicationHelper

#  def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
#    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])#
#end

  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions

  def get_page
    split_path(params[:path])
    #get group_definition
    @group_definition = GroupDefinition.where(["model = ? and action = ?", @path[:model], @path[:action]]).first
    #doesnt exists? create for dont get error
    if @group_definition.nil?
      @group_definition = GroupDefinition.new()
    end
  end

  def get_block_data ## is the new show_partial
    split_path(params[:path])
    bd = BlockDefinition.find_by_uuid(params[:bduuid])
    gd = GroupDefinition.find_by_uuid(bd.gduuid)
    if bd.blocktype == "form"
      @block_data = bd.model.camelize.constantize.find(@path[:id]) rescue nil ##get main object
    elsif bd.blocktype  == "partial" || bd.blocktype  == "list"
      if !bd.conditions.blank?
        @block_data = eval(bd.conditions)
      else
        if bd.model != gd.model
          @block_data = bd.model.camelize.constantize.joins(gd.model.to_sym).where("#{gd.model.pluralize}.id = #{@path[:id]}")
        else
          @block_data = bd.model.camelize.constantize.where(id: @path[:id]) rescue nil
        end
      end
    end
    if @block_data.blank?
      #@block_data = bd.model.camelize.constantize.new
      @block_data = ""
    end
    @block_data = [block_data: @block_data, bd: bd]
  end

  def get_list_block_data
    split_path(params[:path])
    bd = BlockDefinition.find_by_uuid(params[:bduuid])
    gd = GroupDefinition.find_by_uuid(bd.gduuid)
    #if(respond_to?('list_partial'))
    #  object = list_partial(object)
    #else
    if params[:page].to_i == 1
      offset = 0
    else
      offset = params[:page].to_i * params[:limit].to_i - 1
    end
    list_count = bd.model.camelize.constantize.count
    @block_data = bd.model.camelize.constantize.limit(params[:limit].to_i).offset(offset)
    @block_data = [block_data: @block_data, bd: bd, list_count: list_count]

  end

  def show_partial
  #in use for multiple groups
    object = eval(params[:controller].camelize).find(params[:id]) rescue nil
    if(respond_to?('show_partial_workaround'))
      object = show_partial_workaround(object)
    end
    return object
  end

  def path_builder
      #build path from request
    @bd = BlockDefinition.where(:uuid => params[:bduuid]).first
    find_parent = params[:attributes_from].singularize.classify.constantize.find(params[:object_id])
    @path = "/" + find_parent.controller_name + "/" + @bd.action
    render json: @path
  end

  def show_blocks
    #ineed for showing only the blocks / z.b. Home
    render plain: true
  end

  def append_possible_params(object)
    params_key = object.class.to_s.tableize.singularize
    params[:form_data].each do |form_data_object|
      if (form_data_object[:blocktype] == "partial" || form_data_object[:blocktype] == "form" )&& !form_data_object[:block_data].blank?
        form_data_object[:block_data].each do | obj |
          eval("object."+obj[:field_name]+"=obj[:values]") if(form_data_object[:model] == params_key)
          eval("object."+obj[:model]+"."+obj[:field_name]+"=obj[:values]") if(form_data_object[:model] != params_key)
        end
      end
    end
    return object
  end

  def update_partial
    split_path(request.path)
    @gd = GroupDefinition.find(params[:gdid])
    object = eval(@gd.model.camelize).find(params[:object_id])
    object = append_possible_params(object)
    if(respond_to?('update_partial_workaround'))
      object = update_partial_workaround(object, object.id)
    end
    #get errots from Main Object
    errors = {}
    errors[object.class.table_name.singularize] = object.errors unless(object.valid?)

    if(errors.blank?)
    # Save main object
    object.save!
    end
    # Wenn diese Funktion im Controller gegeben ist, wird sie aufgerufen
    # Darin befinden sich spezielle Workarounds für einen Controller
    if(respond_to?('after_update_partial_workaround'))
      object = after_update_partial_workaround(object)
    end
  end

  def autocomplete_generator
  #autocomplete_field get field controller_name and field_name then generate json
  byebug
    create_autocomplete_condtions = params[:controllername].camelize + ".where('" + params[:field_name] + " like ?','%" + params[:value] + "%' )"
    render plain: eval(create_autocomplete_condtions).to_json
  end

  def save_favorites
  #IDEE: Du kannst 3 Favoriten haben z.b. Kunde A, B, C wenn in diesen Kunden eine änderung gemacht wird wird favorite icon angemarkt
    split_path(params[:favorite_item])
    current_user_id = 6
    fav = Favorite.create :model => model, :object_id => id, :user_id => current_user_id
    return true
  end

  def get_favorites
    #IDEE: Du kannst 3 Favoriten haben z.b. Kunde A, B, C wenn in diesen Kunden eine änderung gemacht wird wird favorite icon angemarkt
    current_user_id = 6
    @fav = Favorite.all.where(:user_id => current_user_id) rescue nil
    render plain: @fav.to_json
  end

  def get_recent_items
    render plain: RecentItem.all.where(:controller_name => params[:controller]).to_json
  end

  def tcoms
    render plain: TcomType.all.to_json
  end
end
