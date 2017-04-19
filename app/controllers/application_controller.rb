class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    admins_dashboard_path(current_admin)
  end

  def create_new_lead
    cookies[:subscriber] = params[:email]
    @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], phone: params[:phone], mousetrap: params[:mousetrap], ip_address: request.remote_ip)

    lead = Unirest.post("https://actualize-crm.herokuapp.com/api/v1/leads.json", headers: {
    "Accept" => "application/json", "Content-Type" => "application/json"},
     parameters: {:first_name => params[:first_name], :email => params[:email], :phone => params[:phone], :name => params[:mousetrap], :ip => @subscriber.ip_address}).body
  end

  private

  def verify_subscriber
    unless cookies[:is_subscriber] || cookies[:subscriber]
      redirect_to tutorial_lessons_path
    end
  end

  def authenticate_corporate_training_access
    if current_admin && current_admin.email == "jay@anyonecanlearntocode.com"
      @corporate_access = Admin.find_by(email: "jay@anyonecanlearntocode.com")
    elsif current_admin && current_admin.email == "zev@anyonecanlearntocode.com"
      @corporate_access = Admin.find_by(email: "zev@anyonecanlearntocode.com")
    # elsif current_admin && current_admin.email == "test@gmail.com"
    #   @corporate_access = Admin.find_by(email: "test@gmail.com")
    else
      redirect_to admins_dashboard_path
      flash[:warning] = "You do not have access to this page"
    end
  end
end
