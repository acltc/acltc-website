class ScreencastsController < ApplicationController
  def index
    @screencasts = Screencast.all.order(:priority)
  end
end
