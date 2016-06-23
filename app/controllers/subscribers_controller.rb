class SubscribersController < ApplicationController
  
  def index
    @subscribers = Subscriber.all

    respond_to do |format|
      format.html
      format.csv { send_data @subscribers.to_csv }
    end
  end

  def create
    if params[:mousetrap] == "Application Split Test"
      @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap])
      if @subscriber.save
        converted!("subscriber") #AB Split Test Converterd
        redirect_to "/applications/new/#{@subscriber.id}"
      else
        render :apply
      end
    elsif params[:mousetrap] == "Curriculum Download"
      @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], mousetrap: params[:mousetrap])
      @subscriber.save ? @success = true : @success = false
    else  
      Subscriber.create(email: params[:email]) unless params[:email].blank?
    end
  end

  def apply
    @test = ab_test("subscriber", ["one_step", "two_step"])
    if @test == "two_step"
      @subscriber = Subscriber.new
    else
      redirect_to "/applications/new"
    end
  end

  def download
    render json: { message: "Download in progress"}, status: 200
  end
end
