#@author OG
class HomeController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions
  def show_all
      @home = Home.all
      render json: @home
      puts @home
  end

  def index

    puts "test"
  end
end
