class InfoSessionSignUpsController < ApplicationController  
  before_action :authenticate_admin!, except: [:create, :new, :show]

  def index

    @current_info_session = InfoSession.current_info_session
    @all_info_sessions = InfoSession.all
    @chi_info_session_sign_ups = @current_info_session.info_session_sign_ups.where(city: "Chicago") if @current_info_session
    @nyc_info_session_sign_ups = @current_info_session.info_session_sign_ups.where(city: "New York City") if @current_info_session
    @sf_info_session_sign_ups = @current_info_session.info_session_sign_ups.where(city: "San Francisco") if @current_info_session


    @all_info_session_sign_ups = InfoSessionSignUp.all
    respond_to do |format|
      format.html
      format.csv { send_data @all_info_session_sign_ups.to_csv }
    end

  end

  def new
    @info_session_sign_up = InfoSessionSignUp.new unless @info_session_sign_up
    @current_info_session = InfoSession.current_info_session
  end

  def create
    @current_info_session = InfoSession.current_info_session
    @info_session_sign_up = InfoSessionSignUp.new(name: params[:name], email: params[:email], phone: params[:phone], city: params[:city], info_session_id: params[:info_session_id])

    if @info_session_sign_up.save
      AcltcMailer.info_session_sign_up_email(@info_session_sign_up).deliver_now
      AcltcMailer.info_session_sign_up_confirmation_email(@info_session_sign_up).deliver_now
      redirect_to info_session_sign_up_path(@info_session_sign_up)
    else
      render :new
    end
  end

  def show
    @info_session_sign_up = InfoSessionSignUp.find(params[:id])
  end
end