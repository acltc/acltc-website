class CorporateTrainingMessagesController < ApplicationController
  def index
    @corporate_training_messages = CorporateTrainingMessage.all
  end

  def new
    @corporate_training_message = CorporateTrainingMessage.new
  end

  def create
    @corporate_training_message = CorporateTrainingMessage.new(corporate_training_message_params)

    if @corporate_training_message.save
      AcltcMailer.corporate_training_message(@corporate_training_message).deliver_now
      AcltcMailer.corporate_training_message_reply(@corporate_training_message).deliver_now
      redirect_to contacts_thank_you_path
    else
      flash[:success] = "Unable to send your message!"
      render :new
    end
  end

  def show
    @corporate_training_message = CorporateTrainingMessage.find(params[:id])
  end

  private
  
  def corporate_training_message_params
    params.require(:corporate_training_message).permit(:name, :email, :phone, :team_size, :date, :message, :city, field_of_interest_ids: [])
  end
end
