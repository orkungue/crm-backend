#@author Andreas Treubert
class ListOptionController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions
  #before_action :authenticate_api_user!
  def get_listfilter
    @filter_definitions = FilterDefinition.all.where(:bduuid => params[:bduuid]) rescue nil
    render plain: @filter_definitions.to_json
  end

  def get_saved_filter
    #clicked Filter Button in View for 2 s load all saved filters from the current bd & current user
    @filter_definitions = SavedFilter.all.where(:bduuid => params[:bduuid]).where(:user_id => User.current_user_id) rescue nil
    render plain: @filter_definitions.to_json
  end


  def filter_list_generator
    ## Fiinde den zu filternden Block /list

    bd = BlockDefinition.find_by_uuid(params[:bduuid])

    # show if conditions in bd exists if not user MODEL.all else use bd.conditions
    create_filter_condtions = if !bd.conditions.blank? then bd.conditions else bd.model.camelize + ".all" end

    #add the filterattributs from view that the user used
    params[:filter_attributes].each do | x |
      if !x[:value].blank?
        create_filter_condtions += x[:conditions] + ", '%" + x[:value].to_s + "%')"
      end
    end
    render plain: eval(create_filter_condtions).to_json
    #Gib Mir die Conditions von dem Block
    #und dann ergänze diese mit den Params
    #dann render plain json object
  end

  def list_setting_generator


    puts params

    bd = BlockDefinition.find_by_uuid(params[:bduuid])
    create_filter_condtions = if !bd.conditions.blank? then bd.conditions else bd.model.camelize + ".all" end
      params[:list_setting_attributes][:filter_attributes].each do | x |
        if !x[:value].blank?
          create_filter_condtions += x[:conditions] + ", '%" + x[:value].to_s + "%')"
        end
      end


    render plain: eval(create_filter_condtions).to_json
  end

  def get_listgroup
    @listgroup_definitions = ListGroupDefinition.all.where(:bduuid => params[:bduuid]) rescue nil
    render plain: @listgroup_definitions.to_json
  end

  def group_list_generator

    byebug
    bd = BlockDefinition.find_by_uuid(params[:bduuid])
  end

  def get_listcalc
    bd = BlockDefinition.find_by_uuid(params[:bduuid])
    # get the models datas and datatypes for listcolumncalucaltion
    @list_calc_definitions = bd.model.camelize.constantize.attribute_names.map {|n| [n.to_sym,bd.model.camelize.constantize.type_for_attribute(n).type]}
    render plain: @list_calc_definitions.to_json
  end

end
