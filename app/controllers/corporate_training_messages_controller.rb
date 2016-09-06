class CorporateTrainingMessagesController < ApplicationController
  def new
    @corporate_training_message = CorporateTrainingMessage.new
  end

  def create
    @corporate_training_message = CorporateTrainingMessage.new(corporate_training_message_params)

    if @corporate_training_message.save
      flash[:success] = "Thank you for your message!"
      AcltcMailer.corporate_training_message(@corporate_training_message).deliver_now
      redirect_to root_path
    else
      flash[:success] = "Unable to send your message!"
      render :new
    end
  end

  private
  
  def corporate_training_message_params
    params.require(:corporate_training_message).permit(:name, :email, :phone, :team_size, :date, :message, :city, field_of_interest_ids: [])
  end
end
