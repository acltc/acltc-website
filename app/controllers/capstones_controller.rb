class CapstonesController < ApplicationController
  def index
    @capstones = Capstone.all
  end
end
