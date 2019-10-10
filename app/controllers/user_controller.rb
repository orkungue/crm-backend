#@author OG
class UserController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions

  def show_all
    @users = User.where(:login_disabled => 0).all
    render json: @users
    puts  @users
  end


end
