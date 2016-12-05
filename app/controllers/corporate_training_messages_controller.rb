class CorporateTrainingMessagesController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create, :corporate_training, :thank_you]
  before_action :authenticate_corporate_training_access, only: [:index, :show]
  invisible_captcha only: [:create], honeypot: :subtitle
  layout 'corporate_training_messages', except: [:corporate_training]

  def index
    @corporate_training_messages = CorporateTrainingMessage.all

    respond_to do |format|
      format.html
      format.csv { send_data @corporate_training_messages.to_csv }
    end
  end

  def new
    @corporate_training_message = CorporateTrainingMessage.new
    @field_of_interests = FieldOfInterest.all
  end

  def create
    @corporate_training_message = CorporateTrainingMessage.new(corporate_training_message_params)

    if @corporate_training_message.save
      AcltcMailer.corporate_training_message(@corporate_training_message).deliver_now
      AcltcMailer.corporate_training_message_reply(@corporate_training_message).deliver_now
      redirect_to corporate_training_thank_you_path
    else
      render :new
    end
  end

  def show
    @corporate_training_message = CorporateTrainingMessage.find(params[:id])
  end

  def corporate_training
    render :layout => 'corporate_training_home'
  end

  def thank_you
  end

  private
  
  def corporate_training_message_params
    params.require(:corporate_training_message).permit(
      :company_name, 
      :address_1,
      :address_2,
      :city,
      :state,
      :contact_first_name,
      :contact_last_name, 
      :contact_title, 
      :contact_email, 
      :contact_phone, 
      :training_city, 
      :training_state,
      :team_size,
      :start_date,
      :message,
      field_of_interest_ids: []
    )
  end
end
