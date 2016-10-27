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
        response = Unirest.post(
          "https://api.getdrip.com/v2/7528430/subscribers", 
          headers:{ "Accept" => "application/json", "Content-Type" => "application/vnd.api+json" },
          parameters:{  
            email: params[:email]  
          }
        )
        p "---------------------------"
        p response
        p "Response Code: #{response.code}"
        p "Response Headers: #{response.headers}"
        p "Response Body: #{response.body}"
        p response.body
        p "---------------------------"
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
end
