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
      @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap])
      if @subscriber.save
        cookies[:is_subscriber] = true
        redirect_to "/applications/new/#{@subscriber.id}"
      else
        render :apply
      end
    elsif params[:mousetrap] == "Curriculum Download"
      @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap])
      if @subscriber.save
        cookies[:is_subscriber] = true
        respond_to do |format|
          @java_url = "/subscribers/download"
          format.js {render :partial => "downloadFile"}
        end
      end
    elsif params[:mousetrap] == "View Tutorials"
      @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap])
      if @subscriber.save
        cookies[:is_subscriber] = true
        @tutorials_visible = true
      else
        @tutorials_visible = false
      end
      respond_to do |format|
        format.js {render :partial => "viewTutorials"}
      end
    else  
      @subscriber = Subscriber.create(email: params[:email], mousetrap: "Homepage") unless params[:email].blank?
    end
  end

  def apply
    @subscriber = Subscriber.new
  end

  def download
    url = 'https://s3.amazonaws.com/acltc/ACLTC+Curriculum+2016+SM.pdf'
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename=>"ACLTC_Curriculum_2016.pdf"
  end
end
