class SubscribersController < ApplicationController

  def index
    @subscribers = Subscriber.all

    respond_to do |format|
      format.html
      format.csv { send_data @subscribers.to_csv }
    end
  end

  def create
    if params[:mousetrap] == "Application"
      @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap], ip_address: request.remote_ip)
      if city = request.location.city
        @subscriber.city = city
      end
      if @subscriber.save
        cookies.permanent[:is_subscriber] = true
        redirect_to "/applications/new/#{@subscriber.id}"
      else
        render :apply
      end
    elsif params[:mousetrap] == "Curriculum Download"
      if cookies[:is_subscriber]
        respond_to do |format|
          @java_url = "/subscribers/download"
          format.js {render :partial => "downloadFile"}
        end
      else
        @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap], ip_address: request.remote_ip)
        if city = request.location.city
          @subscriber.city = city
        end
        if @subscriber.save
          cookies.permanent[:is_subscriber] = true
          respond_to do |format|
            @java_url = "/subscribers/download"
            format.js {render :partial => "downloadFile"}
          end
        end
      end
    elsif params[:mousetrap] == "View Tutorials"
      @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap], ip_address: request.remote_ip)
      if city = request.location.city
          @subscriber.city = city
      end
      if @subscriber.save
        cookies.permanent[:is_subscriber] = true
        @tutorials_visible = true
      else
        @tutorials_visible = false
      end
      respond_to do |format|
        format.js {render :partial => "viewTutorials"}
      end
    else
      @subscriber = Subscriber.create(first_name: params[:firstname], email: params[:email], mousetrap: "Homepage Footer") unless params[:email].blank?
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

  def drip_setup
    client = Drip::Client.new do |c|
      c.api_key = "DRIP_CLIENT_API_TOKEN"
      c.account_id = "DRIP_CLIENT_ID"
    end
    @resp = Array(client.subscribers)
    # @subscriber = resp.subscribers.first
    # @accounts = Unirest.get("http://api.getdrip.com/v2/accounts").body
  end

  def drip_get
    @subscribers = subscribers

  end

  # private

  #   def authenticate
  #     curl -H 'User-Agent: Your App Name (www.yourapp.com)' \
  #       -u f4ff6a200e850131dca1040cce1ee51a: \
  #       -d status=active \
  #       https://api.getdrip.com/v2/9999999/campaigns
  #   end
end
