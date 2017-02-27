class SubscribersController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  def index
    @subscribers = Subscriber.all

    respond_to do |format|
      format.html
      format.csv { send_data @subscribers.to_csv }
    end
  end

  def create_from_application
    setup_subscriber

    if !params[:email].strip.empty? && Subscriber.find_by(email: params[:email]) 
      @subscriber = Subscriber.find_by(email: params[:email])
      create_hubspot_contact("Application")
      redirect_to "/applications/new/#{@subscriber.id}"
    elsif @subscriber.save
      create_hubspot_contact("Application")
      subscriber_drip_setup
      redirect_to "/applications/new/#{@subscriber.id}"
      create_for_api
    else
      render :apply
    end
  end

  def create_from_curriculum
    setup_subscriber

    if !params[:email].strip.empty? && Subscriber.find_by(email: params[:email])  || @subscriber.save
      subscriber_drip_setup
      create_hubspot_contact("Curriculum Download Phone Test")
      respond_to do |format|
        @java_url = "/subscribers/download"
        format.js {render :partial => "downloadFile"}
      end
    end
  end

  def create_from_career_pdf
    setup_subscriber

    if !params[:email].strip.empty? && Subscriber.find_by(email: params[:email])  || @subscriber.save
      subscriber_drip_setup
      create_hubspot_contact("Career PDF Download")
      respond_to do |format|
        @pdf_url = "/subscribers/career_pdf_download"
        format.js {render :partial => "downloadCareerPdf"}
      end
    end
  end

  def create_from_tutorial
    if cookies[:is_subscriber]
      @tutorials_visible = true
    else
      setup_subscriber

      if !params[:email].strip.empty? && Subscriber.find_by(email: params[:email])  || @subscriber.save
        create_hubspot_contact("View Tutorials")
        subscriber_drip_setup
        @tutorials_visible = true
      else
        @tutorials_visible = false
      end
      respond_to do |format|
        format.js {render :partial => "viewTutorials"}
      end
    end
  end

  def create_from_footer
    setup_subscriber

    if !params[:email].strip.empty? && Subscriber.find_by(email: params[:email])  || @subscriber.save
      create_hubspot_contact("Homepage Footer")
      subscriber_drip_setup
      respond_to do |format|
        format.js {render :partial => "createFromFooter"}
      end
    end
  end

  def apply
    @subscriber = Subscriber.new
  end

  def download
    url = 'https://s3.us-east-2.amazonaws.com/acltc-website-assets/ACTUALIZE_Curriculum_2017.pdf'
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename=>"Actualize_Curriculum_2017.pdf"
  end

  def career_pdf_download
    url = 'https://s3.us-east-2.amazonaws.com/acltc-website-assets/career_in_coding.pdf'
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename=>"Actualize_Career_In_Coding.pdf"
  end

  private

  def setup_subscriber
    @twilio_format = params[:phone]
    while @twilio_format.length > 10
      @twilio_format.slice!(0)
    end

    @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], phone: @twilio_format.prepend("+1"), mousetrap: params[:mousetrap], ip_address: request.remote_ip)
    if request.location
      if city = request.location.city
        @subscriber.city = city
      end
      if state = request.location.state
        @subscriber.state = state
      end
      if postal_code = request.location.postal_code
        @subscriber.postal_code = postal_code
      end
    end
    return @subscriber
  end

  def create_for_api
    setup_subscriber

    @subscriber = Unirest.post("https://actualize-lead-contact.herokuapp.com/api/v1/leads", headers: {"Accept" => "application/json", "Content-Type" => "application/json"}, parameters: {lead: {first_name: params[:first_name], email: params[:email], phone: @twilio_format.prepend("+1"), city: @subscriber.city, state: @subscriber.state, zip: @subscriber.postal_code, mousetrap: params[:mousetrap], ip_address: request.remote_ip }}).body

    p "-----------------------"
    p @subscriber
    p "-----------------------"
  end

  def subscriber_drip_setup
    client = Drip::Client.new do |c|
      c.api_key = ENV["DRIP_CLIENT_API_TOKEN"]
      c.account_id = ENV["DRIP_ACCOUNT_ID"]
    end

    cookies.permanent[:is_subscriber] = true
    client.create_or_update_subscriber(@subscriber.email)
    client.subscribe(@subscriber.email, 34197704)
    AcltcMailer.subscriber_mousetrap_email(@subscriber).deliver_now
  end

  def create_hubspot_contact(mousetrap_type)
    begin
      contact = Hubspot::Contact.find_by_email(@subscriber.email)
      if !contact
        Hubspot::Contact.create!(@subscriber.email, {firstname: @subscriber.first_name, phone: @subscriber.phone, lead_type: "Mousetrap", mousetrap: mousetrap_type, created_at: @subscriber.created_at})
      end
    rescue Exception => e
      p "rescue #{e.message}"
    end
  end

end
