class SocialMediaController < ApplicationController
  def new_post
    # send post and strip
    previous_post = SocialMedium.first
    previous_post_time = previous_post.previous_post_time

    next_post_time = time_of_next_post(previous_post_time)

    while next_post_time < Time.now + 3.minutes
      next_post_time = time_of_next_post(next_post_time)
    end

    message = params[:message]
    message.slice! "#actualize"
    message.strip!
    previous_post.update(previous_post_time: next_post_time)
    render json: {time: next_post_time, message: message}
  end

  private

  def time_of_next_post(previous_post_time)
    day_of_week = previous_post_time.strftime("%A")
    time_of_day = previous_post_time.strftime("%H:%M")

    added_days = 1
    added_hours = 3

    if day_of_week == "Friday"
      added_days += 2
    end

    if time_of_day == "17:00"
      added_hours *= -1
    elsif time_of_day == "14:00"
      added_days = 0
    end

    previous_post_time + added_hours.hours + added_days.days
  end
end
