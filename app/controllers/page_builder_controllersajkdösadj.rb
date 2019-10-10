#@author Orkun Günes
class PageBuilderController < ApplicationController
  include Response
  include ExceptionHandler

  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions
  def get_page
    ar_path = params[:path].split("/")
    model = ar_path[1]
    action = ar_path[2] rescue nil
    id = ar_path[3] rescue nil
    @group_definition = GroupDefinition.where(["model = ? and action = ?",model, action]).first
    if @group_definition.nil?
      @group_definition = GroupDefinition.new()
    end
         #fml part1  erstellt eine variable wenn block_definitions model und conditions nicht leer ist => führe conditions von block aus ansonsten geht er is die function
         # => z.b. wenn Kundenliste Conditions existiert benutzt er diesen geht es in def customer show_all
    bds = BlockDefinition.all.where(:gduuid => @group_definition.uuid).where.not(:model => nil).where.not(:conditions => nil)
    bds.each do |bd|
      instance_variable_set('@' + bd.model, eval(bd.conditions)) rescue nil
    end
    return self
  end

  def path_builder
    @bd = BlockDefinition.where(:uuid => params[:bduuid]).first
     # redirect_to :controller => @bd.model.to_s, :action => @bd.action.to_s, id: params[:object_id]
        # OR
     #your_action_instance = @bd.model.camelize.new()
     #your_action_instance.@bd.action(params, request)
  end

  def append_possible_params(object)
    params_key = @object.class.to_s.tableize.singularize
    if params.include?(params_key)
      @object.attributes.each do |key, value|
        eval("object."+key+"=params[params_key][key]") if(params[params_key].include?(key))
      end
    end
    return @object
  end

  def show_partial
    ar_path = request.path.sub("api/", "").split("/")
    model = ar_path[1]
    action = ar_path[2] rescue nil
    id = ar_path[3] rescue nil
    @object = eval(model.camelize).find(params[:id]) rescue nil
    render json: @object
    #object = append_possible_params(object)
    #byebug
    #if(respond_to?('show_partial_workaround'))
    #  object, sec = update_partial_workaround(object)
    #end
  end

  def new_partial
  end

  def update_partial
    ar_path = request.path.sub("api/", "").split("/")
    model = ar_path[1]
    action = ar_path[2] rescue nil
    id = ar_path[3] rescue nil
    object = eval(model.camelize).find(params[:id]) rescue nil
    @object = append_possible_params(object)

    if(respond_to?('update_partial_workaround'))
      @object, sec = update_partial_workaround(@object)
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

  def get_filter
    @filter_definitions = FilterDefinition.all.where(:bduuid => params[:bduuid]) rescue nil
    render plain: @filter_definitions.to_json
  end

  def get_saved_filter
    @filter_definitions = SavedFilter.all.where(:bduuid => params[:bduuid]).where(:user_id => User.current_user_id) rescue nil
    render plain: @filter_definitions.to_json
  end

  def filter_list_gernerator

    puts params[:bduuid]

    bd = BlockDefinition.find(params[:bduuid]) ## Fiinde den zu filternden Block /list
    create_filter_condtions = if !bd.conditions.blank? then bd.conditions else bd.model.camelize + ".all" end
    params[:attributes].each do | x |
      if !x[:value].blank?
        create_filter_condtions += x[:conditions] + ", '%" + x[:value].to_s + "%')"
      end
    end
    render plain: eval(create_filter_condtions).to_json


    # Gib Mir die Conditions von dem Block
    #und dann ergänze diese mit den Params
    #dann render plain json object
  end

  def save_favorites
  #IDEE: Du kannst 3 Favoriten haben z.b. Kunde A, B, C wenn in diesen Kunden eine änderung gemacht wird wird favorite icon angemarkt
    ar_path = params[:favorite_item].split("/")
    model = ar_path[1]
    action = ar_path[2]
    id = ar_path[3] rescue nil
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

  def tcom

  end

end
