class InfoSessionSignUpsController < ApplicationController  
  def index
    @info_sessions = InfoSessionSignUp.all
  end

  def create
    @info_session = InfoSessionSignUp.new(name: params[:name], email: params[:email], phone: params[:phone], city: params[:city], date: params[:date])

    if @info_session.save
      flash[:success] = "Thank you for signing up!"
      redirect_to "/"
    else
      flash[:warning] = "Sign up failed to record"
      redirect_to "/"
    end
  end
end


