class InfoSessionSignUpsController < ApplicationController  
  before_action :authenticate_admin!, except: [:create, :new]

  def index
    current_info_session = InfoSession.current_info_session
    @chi_info_session_sign_ups = InfoSessionSignUp.where(city: "Chicago", date: current_info_session.date)
    @nyc_info_session_sign_ups = InfoSessionSignUp.where(city: "New York City", date: current_info_session.date)
    @sf_info_session_sign_ups = InfoSessionSignUp.where(city: "San Francisco", date: current_info_session.date)

    @all_info_session_sign_ups = InfoSessionSignUp.all
    respond_to do |format|
      format.html
      format.csv { send_data @all_info_session_sign_ups.to_csv }
    end

  end

  def new
    @info_session_sign_up = InfoSessionSignUp.new unless @info_session_sign_up
  end

  def create
    @current_info_session = InfoSession.current_info_session
    @info_session_sign_up = InfoSessionSignUp.new(name: params[:name], email: params[:email], phone: params[:phone], city: params[:city], date: params[:date])

    if @info_session_sign_up.save
      redirect_to info_session_sign_up_path(@info_session_sign_up)
    else
      render :new
    end
  end

  def show
    @info_session_sign_up = InfoSessionSignUp.find(params[:id])
  end
end