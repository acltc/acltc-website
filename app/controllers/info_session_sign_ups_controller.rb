class InfoSessionSignUpsController < ApplicationController  
  before_action :authenticate_admin!, except: [:create, :new, :show]

  def index
    @current_info_sessions = InfoSession.current_sessions
    @current_info_session = @current_info_sessions.current_info_session
    
    chicago = []
    nyc = []
    sf = []
    @current_info_sessions.each do |session|
      session.info_session_sign_ups.each do |sign_up|
        case sign_up.city 
          when "Chicago"
            chicago << sign_up
          when "New York City"
            nyc << sign_up
          else 
            sf << sign_up
        end
      end
    end

    @all_info_sessions = InfoSession.all
    @chi_info_session_sign_ups = chicago if @current_info_sessions
    @nyc_info_session_sign_ups = nyc if @current_info_sessions
    @sf_info_session_sign_ups = sf if @current_info_sessions

    @all_info_session_sign_ups = InfoSessionSignUp.all
    respond_to do |format|
      format.html
      format.csv { send_data @all_info_session_sign_ups.to_csv }
    end

  end

  def new
    @info_session_sign_up = InfoSessionSignUp.new unless @info_session_sign_up
    @next_info_session = InfoSession.next_info_session
  end

  def create
    @next_info_session = InfoSession.next_info_session
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