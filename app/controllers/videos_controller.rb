class VideosController < ApplicationController

	SIXTY_DAYS = {
		'qc8ibzuGI6M' => 1,
		'TPfN0FAfUwo' => 2,
		'FfQ8P7fVClI' => 3
	}

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

	def sixty_day_show
		@video_url = params[:url] || 'qc8ibzuGI6M'
		@day_number = SIXTY_DAYS[@video_url] || 1
		render "/videos/sixty_days/show", layout: 'main'
	end

end
