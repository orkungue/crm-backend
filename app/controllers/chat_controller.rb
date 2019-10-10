#@author OG
class Api::ChatController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions

  def show_all
    @users = User.where(:login_disabled => 0).all
    render json: @users
 end

 def get_object
   current_user = params[:current_user]
   current_user = 6
   @chat = Chat.where("(send_from = ? and send_to = ?) or (send_from = ? and send_to = ?)", current_user, params[:id], params[:id], current_user).order('created_at ASC').all
   render json: @chat
end

def update_chat
  @chat = Chat.new(:send_from => params[:from], :send_to => params[:to], :text => params[:text])
  @chat.save!

  current_user = params[:current_user]
  current_user = 6
  @chat = Chat.where("(send_from = ? and send_to = ?) or (send_from = ? and send_to = ?)", params[:from], params[:to], params[:to], params[:from]).order('created_at ASC').all
  render json: @chat
end

end
