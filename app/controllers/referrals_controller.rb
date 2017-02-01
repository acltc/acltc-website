class ReferralsController < ApplicationController
  def index
  end

  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.new(
        referrer_first_name: params[:referral][:referrer_first_name],
        referrer_last_name: params[:referral][:referrer_last_name],
        referrer_email: params[:referral][:referrer_email],
        referrer_phone_number: params[:referral][:referrer_phone_number],
        referred_first_name: params[:referral][:referred_first_name],
        referred_email: params[:referral][:referred_email]
      )

    if @referral.save
      redirect_to '/referrals/new'
    else
      render :new
    end
  end
end
