#@author OG
class UploadController < ApplicationController
  # Handles the API-Call for the react pages
  # @param model_name [string] the model for this request
  # @param action [string] the action for this request
  # @param id [integer] the id for this request
  # @return [JSON-Object] the resulting GroupDefinition with all dependencies like Block- and FieldDefinitions
  def index
  end

  def upload
    split_path(params[:path])
    @path[:model] = @path[:model].split('_')[0]  #change doc_types to generic doc
    file = params[:file]
    ul = Upload.new()
    ul.filename = file.original_filename
    ul.content_type = file.content_type
    ul.file_content = file.read
    if @path[:actiom] == 'new'
      session[:tmp_uploads] = {} if(session[:tmp_uploads].blank?)
      session[:tmp_uploads][bd.unified_block_id] = [] if(session[:tmp_uploads][bd.unified_block_id].blank?)
      session[:tmp_uploads][bd.unified_block_id] << @upload
    else
      eval("ul."+@path[:model]+"_id" + "=" + @path[:id]) #save id in the right column
    end
    ul.save
    @file = ul.id
    render plain: @file.to_json
  end

  def delete
    file = Upload.find(params[:id])
    filename = file.filename
    #do this that we dont need to archive the deleted files in database
    if !file.customer_id.blank?
      filename << "#customer_id=" + file.customer_id.to_s
    elsif !file.document_id.blank?
      filename << "#document_id=" + file.document_id.to_s
    elsif !file.event_id.blank?
      filename << "#event_id=" + file.event_id.to_s
    else
      filename << "#no_assignment#upload_id=" + file.id.to_s
    end
      filename << "#created_at="+file.created_at.to_s
      filename << "#deleted_at="+ Time.now().to_s

      open("/home/orkun/Desktop/bsp/backup16.08_läuft/logo-api-rails/tmp/#{filename}", 'wb') do |save_file|
        save_file << file.file_content
      end
    file.delete
    head :ok
  end

  def download
    file = Upload.find(params[:id])
    send_data(file.file_content, filename: file.filename, type: file.content_type, disposition: 'attachment')
  end
end
