class SocialMediaController < ApplicationController
  def new_post
    # make it such that you check that the new date is in the future
    previous_post = SocialMedium.first
    if previous_post.previous_post_time.strftime("%A") == "Monday"
      new_time = previous_post.previous_post_time + 2.days
    elsif previous_post.previous_post_time.strftime("%A") == "Wednesday"
      new_time = previous_post.previous_post_time + 5.days
    end
    if new_time < Time.now
      while new_time <= Time.now + 3.minutes
        p 'in while loop'
        if new_time.strftime("%A") == "Monday"
          p 'in monday if statement. should be here'
          new_time = new_time + 2.days
        elsif new_time.strftime("%A") == "Wednesday"
          p 'in wednesday if statement. should not be here'
          new_time = new_time + 5.days
        end
      end
    end
    previous_post.update(previous_post_time: new_time)
    render json: {time: new_time}
  end
end
