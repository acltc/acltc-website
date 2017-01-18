class InfoSessionsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @info_sessions = InfoSession.current_sessions
  end

  def new
    @info_session = InfoSession.new
  end

  def create
    @info_session = InfoSession.new(info_session_params)

    if @info_session.save
      flash[:success] = "New Info Session created"
      redirect_to info_sessions_path
    else
      flash[:warning] = "Failed to create new Info Session"
      render :new
    end
  end

  def edit
    @info_session = InfoSession.find(params[:id])
  end

  def destroy
    @info_session = InfoSession.find(params[:id])

    if @info_session.destroy
      flash[:success] = "Info Session destroyed"
      redirect_to info_sessions_path
    else
      flash[:warning] = "Failed to destroy Info Session"
      redirect_to info_sessions_path
    end
  end

  private

    def info_session_params
      params.require(:info_session).permit(:date)
    end
end
