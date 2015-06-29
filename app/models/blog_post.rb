class BlogPost < ActiveRecord::Base
  extend FriendlyId
  
  belongs_to :admin
  has_and_belongs_to_many :blog_categories
  accepts_nested_attributes_for :blog_categories
  has_many :blog_pics

  friendly_id :title, use: :slugged

  

  def blog_pics=(attrs)
    attrs.each { |attr| self.blog_pics.build(:blog_pic => attr) }
  end

  def human_time
    updated_at.strftime("%d %B %y")
  end

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end

  def get_category_names
    blog_categories.map { |category| link_to category.name, "/blog_posts?category=#{category.name}" }.join(',').html_safe
  end

  def truncate_blog_post
    content.gsub(/<img[^>]+\>/i, "").truncate(400).html_safe
  end
  
end
