class ReferralsController < ApplicationController
  before_action :authenticate_admin!, only: :index

  def index
    @referrals = Referral.all.order("created_at desc")

    respond_to do |format|
      format.html
      format.csv {send_data @referrals.to_csv}
    end
  end

  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.new(referral_params)
    @email_body = params[:email_body]

    if @referral.save
      AcltcMailer.referral_email(@referral, @email_body).deliver_now
      
      redirect_to '/referrals/thank_you'
    else
      render :new
    end
  end

  def thank_you
  end

  private

  def referral_params
    params.require(:referral).permit(:referrer_first_name, :referrer_last_name, :referrer_email, :referrer_phone_number, :referred_first_name, :referred_email)
  end
end
