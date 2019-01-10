class VideosController < ApplicationController

	SIXTY_DAYS = {
		'goGY40UBKg0' => 1
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
		@day_number = SIXTY_DAYS[params[:url]] || 1
		render "/videos/sixty_days/#{@day_number}", layout: 'main'
	end

end
