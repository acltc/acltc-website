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
    subscriber_setup

    if Subscriber.find_by(email: params[:email]) 
      @subscriber = Subscriber.find_by(email: params[:email]) 
      redirect_to "/applications/new/#{@subscriber.id}"
    elsif @subscriber.save
      subscriber_drip_setup
      redirect_to "/applications/new/#{@subscriber.id}"
    else
      render :apply
    end
  end

  def create_from_popup
    subscriber_setup

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
    
    if @subscriber.save
      render :nothing => true
    end
    # respond_to do |format|
    #   format.js {render :partial => "viewPopup"}
    # end
  end

  def create_from_curriculum
    if cookies[:is_subscriber]
      respond_to do |format|
        @java_url = "/subscribers/download"
        format.js {render :partial => "downloadFile"}
      end
    else
      @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap], ip_address: request.remote_ip, phone: params[:phone])
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

      if Subscriber.find_by(email: params[:email]) || @subscriber.save
        subscriber_drip_setup
        respond_to do |format|
          @java_url = "/subscribers/download"
          format.js {render :partial => "downloadFile"}
        end
      end
    end
  end

  def create_from_tutorial

    if cookies[:is_subscriber]
      @tutorials_visible = true
    else
      subscriber_setup

      if Subscriber.find_by(email: params[:email]) || @subscriber.save
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
    subscriber_setup

    if Subscriber.find_by(email: params[:email]) || @subscriber.save
      subscriber_drip_setup
    else
      render :apply
    end
  end

  def apply
    @subscriber = Subscriber.new
  end

  def download
    url = 'https://s3.amazonaws.com/acltc/Actualize_Curriculum_2016.pdf'
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename=>"Actualize_Curriculum_2016.pdf"
  end

  private

  def subscriber_setup
    @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap], ip_address: request.remote_ip)
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


end
