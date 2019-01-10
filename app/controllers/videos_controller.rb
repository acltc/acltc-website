class VideosController < ApplicationController

	def tlase_show
		if params[:url] && params[:episode]
			@video_url = params[:url]
			@episode_number = params[:episode]
		else
			@episode_number = 1
			@video_url = 'G9DPZIRnoDI'
		end 
		render layout: 'main'
	end

end
