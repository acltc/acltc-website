class VideosController < ApplicationController
	before_action :authenticate_admin!, only: [:tlase_new, :tlase_create, :tlase_edit, :tlase_update]
	SIXTY_DAYS = {
		'qc8ibzuGI6M' => 1,
		'TPfN0FAfUwo' => 2,
		'FfQ8P7fVClI' => 3,
		'I-dhIfJ86Yc' => 4
	}

	def tlase_show
		@source = params[:utm_source]
		if params[:url] && params[:episode]
			@video_url = params[:url]
			@episode_number = params[:episode]
		else
			@episode_number = 1
			@video_url = 'G9DPZIRnoDI'
		end
		render layout: 'main'
	end

	def tlase_index
		@videos = TlaseVideo.order(:episode)
	end

	def new_tlase_show
		@video = TlaseVideo.find_by(episode: params[:episode_id])
	end

	def tlase_new
		@video = TlaseVideo.new
	end

	def tlase_create
		video_id = params[:vimeo_url].split("/")[-1]
		image_url = Unirest.get("http://vimeo.com/api/v2/video/#{video_id}.json").body[0]['thumbnail_medium']
		@video = TlaseVideo.new(vimeo_url: params[:vimeo_url], episode: params[:episode_number], title: params[:title], description: params[:description], image_url: image_url)
		@video.save
		redirect_to "/think-like-a-software-engineer/videos/#{@video.episode}"
	end

	def tlase_edit
		@video = TlaseVideo.find_by(episode: params[:episode_id])
	end

	def tlase_update
		@video = TlaseVideo.find_by(episode: params[:episode_id])
		@video.update(vimeo_url: params[:vimeo_url], episode: params[:episode_number], title: params[:title], description: params[:description], image_url: params[:image_url])
		redirect_to "/think-like-a-software-engineer/videos/#{@video.episode}"
	end

	def sixty_day_show
		@video_url = params[:url] || 'qc8ibzuGI6M'
		@day_number = SIXTY_DAYS[@video_url] || 1
		render "/videos/sixty_days/show", layout: 'main'
	end

end
