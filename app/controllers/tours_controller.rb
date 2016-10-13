class ToursController < ApplicationController
  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)

    if @tour.save
      @tour.interview.update(booked: true)
      AcltcMailer.application_email(@tour).deliver_now
      redirect_to "/tours/thank_you"
    else
      render :new
    end
  end

  def thank_you
  end

  private
    def tour_params
      params.require(:tour).permit(
        :city,
        :first_name,
        :last_name,
        :email,
        :phone,
        :interview_id
      )
    end
end
