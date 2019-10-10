#@author Andreas Treubert
class CustomerController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions
  #before_action :authenticate_api_user!

  def list_partial
   @customer_types = CustomerType.all
   #render json: { #:customer_types => @customer_types,
                 #:customer => @customer }

    #render @customer_types.to_json


    render json: @object

  end

  def show_partial
    @object = eval(params[:controller].camelize).find(params[:id]) rescue nil
    render plain: @object.to_json
  end

  def test_partial_workaround
    puts "alalalasmdölajfla"
  end
end
