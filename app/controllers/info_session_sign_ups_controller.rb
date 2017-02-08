class InfoSessionSignUpsController < ApplicationController  
  before_action :authenticate_admin!, except: [:create, :new, :show]

  def index
    @current_info_sessions = InfoSession.current_sessions
    @current_info_session = @current_info_sessions.current_info_session

    @chi_info_session_sign_ups = InfoSession.chicago_sign_ups if @current_info_session
    @nyc_info_session_sign_ups = InfoSession.nyc_sign_ups if @current_info_session
    @sf_info_session_sign_ups = InfoSession.sf_sign_ups if @current_info_session

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
      create_hubspot_contact
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

  private

  def create_hubspot_contact
    contact = Hubspot::Contact.find_by_email(params[:email])
    if contact
      if contact["lead_type"] == "Mousetrap"
        contact.update!({lead_type: "Info Session"})
      end
    else
      Hubspot::Contact.create!(params[:email], {firstname: params[:name], phone: params[:phone], lead_type: "Info Session", created_at: @info_session_sign_up.created_at })
    end   
  end

end