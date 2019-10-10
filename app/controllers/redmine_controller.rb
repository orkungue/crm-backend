#@author OG
class RedmineController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions

  def index
    puts "test"
  end

  def edit_partial_workaround
  # Retrieving issues

  issues = Redmine.find(:all)
  @issus =  issues.first.subject
  render plain: @issus.to_json

  end
end
