class ReferralsController < ApplicationController
  def index
  end

  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.new(referral_params)

    if @referral.save
      redirect_to '/referrals/new'
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
