class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def contact
    if params[:fix]
      ContactMailer.delay_for(1.second).send_contact_message
    else
      ContactMailer.send_contact_message.deliver_now!
    end
    respond_to do |format|
      format.html
      format.json { render json: { success: true } }
    end
  end
end
