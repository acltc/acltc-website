class CorporateTrainingMessagesController < ApplicationController
  # before_action :authenticate_admin!, except: [:new, :create, :corporate_training]
  # before_action :authenticate_corporate_training_access, only: [:index]
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
      redirect_to contacts_thank_you_path
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

  private
  
  def corporate_training_message_params
    params.require(:corporate_training_message).permit(:company_name, :company_contact, :email, :phone, :team_size, :date, :message, :training_location, :company_contact_title, :address_1, :address_2, :company_city, :state, field_of_interest_ids: [])
  end
end
