class SubscribersController < ApplicationController
  def create
    Subscriber.create(email: params[:email]) unless params[:email].blank?
  end
end
