class ScholarshipsController < ApplicationController

	def new
    @scholarship = Scholarship.new
    render layout: 'main'
  end

  def create
    @scholarship = Scholarship.new(scholarship_params)
    if @scholarship.save
      AcltcMailer.scholarship_email(@scholarship).deliver_now
      redirect_to "/pages/thank_you"
    else
      render 'new', layout: 'main'
    end
  end

  private

  def scholarship_params
    params.require(:scholarship).permit(:full_name, :email, :dreams_and_goals, :change_your_life, :perfect_candidate)
  end

end
