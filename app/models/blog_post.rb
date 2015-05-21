class BlogPost < ActiveRecord::Base

  def human_time
    updated_at.strftime("%d %B %y")
  end
  
end
