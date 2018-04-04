class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    admins_dashboard_path(current_admin)
  end

  def track_web_traffic_source
    cookies[:source] = "#{params[:utm_source]} #{params[:utm_medium]}"
  end

  def create_new_lead
    cookies[:subscriber] = params[:email]
    @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], phone: params[:phone], mousetrap: params[:mousetrap], ip_address: request.remote_ip, source: cookies[:source])

    lead = Unirest.post("https://actualize-crm.herokuapp.com/api/v1/leads.json", headers: {
    "Accept" => "application/json", "Content-Type" => "application/json"},
     parameters: {:first_name => params[:first_name], :email => params[:email], :phone => params[:phone], :name => params[:mousetrap], :ip => @subscriber.ip_address, :source => cookies[:source]}).body
  end

  def record_return_to_website_event
    if cookies[:subscriber] && hasnt_visited_within_24_hours
      lead = Unirest.post("https://actualize-crm.herokuapp.com/api/v1/leads.json", headers: {
      "Accept" => "application/json", "Content-Type" => "application/json"},
       parameters: {:email => cookies[:subscriber], :name => "Visited Website"}).body
      cookies[:last_visited] = Time.now
    end
  end

  private

  def hasnt_visited_within_24_hours
    !cookies[:last_visited] || (Time.now - DateTime.parse(cookies[:last_visited])) > 86400
  end

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
