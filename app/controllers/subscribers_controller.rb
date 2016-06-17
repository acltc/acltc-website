class SubscribersController < ApplicationController
  
  def index
    @subscribers = Subscriber.all

    respond_to do |format|
      format.html
      format.csv { send_data @subscribers.to_csv }
    end
  end

  def create
    if params[:subscriber]
      @subscriber = Subscriber.new(email: params[:subscriber][:email], first_name: params[:subscriber][:first_name], mousetrap: params[:subscriber][:mousetrap])
      if @subscriber.save
        converted!("subscriber")
        redirect_to "/applications/new/#{@subscriber.id}"
      else
        render :apply
      end
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
end
