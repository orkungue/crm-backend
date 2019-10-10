#@author OG
class DefaultGroupController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions


  def list_partial
      @document_types = DocType.all
      @object = Document.all
      render json: @object
 end

 def get_default_list_group
  split_path(params[:path])
   # bd = BlockDefinition.find_by_uuid(params[:bduuid])
   # show if conditions in bd exists if not user MODEL.all else use bd.conditions
   @list_groups = DefaultGroup.where(:model => @path[:model])

   #add the filterattributs from view that the user used
   params[:attributes].each do | x |
     if !x[:value].blank?
       create_filter_condtions += x[:conditions] + ", '%" + x[:value].to_s + "%')"
     end
   end
   render plain: eval(create_filter_condtions).to_json
 end

def show_partial_workaround(object)

end

def redirect_to_document_controller(object, params = {})
  doc_type = DocType.find(object.doc_type_id)
    #redirect_to({ :controller => doc_type.controller_name, :action => :show_partial, :id => doc_type.controller_name.camelize.constantize.find_by_document_id(object.id).id, :path => "/" + doc_type.controller_name + "/edit/" }.merge(params))
    @path = "/" + doc_type.controller_name.to_s + "/edit/" + doc_type.controller_name.camelize.constantize.find_by_document_id(object.id).id.to_s
    render json: { path: @path, block_data: object}
    #redirect_to({:controller => "application", :action =>"get_page", })
  end

 def update_object
 end

end
