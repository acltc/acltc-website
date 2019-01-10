class SubscribersController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  def index
    @subscribers = Subscriber.all

    respond_to do |format|
      format.html
      format.csv { send_data @subscribers.to_csv }
    end
  end

  def create_from_popup
    create_new_lead
    respond_to do |format|
      format.js {render :partial => "popupSubscriber"}
    end
  end

  def create_from_tour
    create_new_lead
    redirect_to "/tours/thank_you"
  end

  def create_from_started_application
    create_new_lead
    Application.delay(run_at: 24.hours.from_now).remind(params[:first_name], params[:email], params[:phone])
    url = "/applications/new?first_name=#{params[:first_name]}&email=#{params[:email]}&phone=#{params[:phone]}"
    url += "&referral=#{params[:referral]}" if params[:referral]
    redirect_to url
  end

  def create_from_curriculum 
    create_new_lead unless params[:contact_me_by_fax_only]# contact_me_by_fax_only is a spam honeypot
    send_file "#{Rails.root}/public/pdfs/Actualize-2018-Curriculum.pdf"
  end

  def create_from_career_pdf
    create_new_lead unless params[:contact_me_by_fax_only]# contact_me_by_fax_only is a spam honeypot
    send_file "#{Rails.root}/public/pdfs/Actualize-Career-In-Coding.pdf"
  end

  def create_from_tutorial
    create_new_lead
    respond_to do |format|
      format.js {render :partial => "viewTutorials"}
    end
  end

  def create_from_webinar
    create_new_lead unless params[:contact_me_by_fax_only]# contact_me_by_fax_only is a spam honeypot
    redirect_to "/pages/webinar_thank_you"
  end

  def create_from_tlase
    create_new_lead unless params[:contact_me_by_fax_only]# contact_me_by_fax_only is a spam honeypot
    redirect_to "/pages/tlase_thank_you"
  end

  def create_from_sixty_day
    create_new_lead unless params[:contact_me_by_fax_only]# contact_me_by_fax_only is a spam honeypot
    redirect_to "/pages/tlase_thank_you"
  end

  def create_from_blog
    create_new_lead unless params[:contact_me_by_fax_only]# contact_me_by_fax_only is a spam honeypot
    redirect_to "/pages/tlase_thank_you"
  end

  def create_from_footer
    create_new_lead
    respond_to do |format|
      format.js {render :partial => "createFromFooter"}
    end
  end

  def apply
    track_web_traffic_source
    record_return_to_website_event
    @subscriber = Subscriber.new
    @referral = params[:referral] if params[:referral]
    @referral = params[:scholarship] if params[:scholarship]
    render layout: 'main'
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

  def subscriber_drip_setup
    client = Drip::Client.new do |c|
      c.api_key = ENV["DRIP_CLIENT_API_TOKEN"]
      c.account_id = ENV["DRIP_ACCOUNT_ID"]
    end

    cookies.permanent[:is_subscriber] = true
    client.create_or_update_subscriber(@subscriber.email, {custom_fields: {first_name: @subscriber.first_name, cell_phone: @subscriber.phone, mousetrap: @subscriber.mousetrap, city: @subscriber.city}})
    client.apply_tag(@subscriber.email, @subscriber.mousetrap)
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
