class Api::V1::SubscribersController < ApplicationController

  def create_from_popup
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      render :nothing => true
    else
      render json: {errors: @subscriber.errors.messages}, status: 422 
    end
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(
        :first_name,
        :email
      )
    end
end
