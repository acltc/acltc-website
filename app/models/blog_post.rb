class BlogPost < ActiveRecord::Base

  belongs_to :admin
  has_and_belongs_to_many :blog_categories
  accepts_nested_attributes_for :blog_categories

  def human_time
    updated_at.strftime("%d %B %y")
  end
  
end
