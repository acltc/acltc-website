class SocialMediaController < ApplicationController
  def new_post
    previous_post = SocialMedium.first
    if previous_post.previous_post_time.strftime("%A") == "Monday"
      new_time = previous_post.previous_post_time + 2.days
    elsif previous_post.previous_post_time.strftime("%A") == "Wednesday"
      new_time = previous_post.previous_post_time + 5.days
    end
    previous_post.update(previous_post_time: new_time)
    render json: {time: new_time}
  end
end
