class SubscribersController < ApplicationController
  def create
    Subscriber.create(email: params[:email])
  end
end
