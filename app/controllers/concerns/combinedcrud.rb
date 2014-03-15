module Combinedcrud extend ActiveSupport::Concern
  def destroy_and_redirect(obj, redirect_url)
    obj.destroy
    respond_to do |format|
      format.html { redirect_to redirect_url }
      format.json { head :no_content }
    end
  end
  
end