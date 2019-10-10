#@author Andreas Treubert
class CustomerOwnerController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions
  #before_action :authenticate_api_user!

  def list_partial
   @customer_types = CustomerType.all
   @object = Customer.all
   #render json: { #:customer_types => @customer_types,
                 #:customer => @customer }

    render @customer_types.to_json
    #render json: @object
  end

  def show_partial_workaround(object)
    @customer = Customer.find(params[:id])
    render json: @customer
  end

end
