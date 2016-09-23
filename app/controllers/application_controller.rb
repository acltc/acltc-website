class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    admins_dashboard_path(current_admin)
  end

  private

  def verify_subscriber
    unless Subscriber.find_by(ip_address: request.remote_ip) || cookies[:is_subscriber]
      redirect_to tutorial_lessons_path
    end  
  end

  def authenticate_corporate_training_access
    if current_admin && current_admin.email == "jay@anyonecanlearntocode.com"
      @corporate_access = Admin.find_by(email: "jay@anyonecanlearntocode.com")
    elsif current_admin && current_admin.email == "zev@anyonecanlearntocode.com"
      @corporate_access = Admin.find_by(email: "zev@anyonecanlearntocode.com")
    elsif current_admin && current_admin.email == "test@gmail.com"
      @corporate_access = Admin.find_by(email: "test@gmail.com")
    else
      redirect_to admins_dashboard_path
      flash[:warning] = "You do not have access to this page"
    end
  end
end
