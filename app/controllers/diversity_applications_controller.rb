class DiversityApplicationsController < ApplicationController
  # before_filter :authenticate_admin!, only: [:new, :create, :update, :delete]

  def index
    # @faqs = Faq.all.order(:priority)
    render :layout => 'home_application'
  end

end
