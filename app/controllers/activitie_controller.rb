#@author OG
class Api::ActivitieController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions

  def show_all
    params[:current_user_id] = 6
    @activitie = Activitie.where(:owner_id => params[:current_user_id]).all
    render json: @activitie
 end
end
