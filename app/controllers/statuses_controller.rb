class StatusesController < ApplicationController
  def edit
    @status = Status.find_by(id: params[:id])
  end

  def update
    @status = Status.find_by(id: params[:id])
    if @status.update(date: "#{params[:date][:year]}-#{params[:date][:month]}-#{params[:date][:day]}")
      redirect_to application_path(@status.application)
    else
      render :edit
    end
  end
end
