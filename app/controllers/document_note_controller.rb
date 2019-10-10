#@author OG
class DocumentNoteController < DocumentController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions

 def create_partial
   object.save!
   return object.id
 end

 def show_partial
 end

  def get_object
    @doc = Document.find(params[:id])
  end

 def update_object
 end

end
