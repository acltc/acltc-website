class LessonsController < ApplicationController
  def index
  end

  def show
    render params[:title]
  end
end
