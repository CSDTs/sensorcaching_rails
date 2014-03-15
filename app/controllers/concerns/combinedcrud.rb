module Combinedcrud extend ActiveSupport::Concern
  def destroy_and_redirect(obj, redirect_url)
    obj.destroy
    respond_to do |format|
      format.html { redirect_to redirect_url }
      format.json { head :no_content }
    end
  end
  
  def create_save(obj, obj_name)
    respond_to do |format|
      if obj.save
        format.html { redirect_to obj, notice: obj_name + ' was successfully created.' }
        format.json { render action: 'show', status: :created, location: obj }
      else
        json_error_return(obj, 'new')
      end
    end
  end
  
  def update_save(obj, obj_params, obj_name)
    respond_to do |format|
      if obj.update(obj_params)
        format.html { redirect_to obj, notice: obj_name + ' was successfully updated.' }
        format.json { head :no_content }
      else
        json_error_return(obj, 'edit')
      end
    end
  end
  
  def json_error_return(obj, action)
    format.html { render action: action }
    format.json { render json: obj.errors, status: :unprocessable_entity }
  end
  
end