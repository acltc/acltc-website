class BlogPost < ActiveRecord::Base
  belongs_to :admin
  has_and_belongs_to_many :blog_categories
  accepts_nested_attributes_for :blog_categories
  has_many :blog_pics

  def to_param
    "#{year}/#{month}/#{day}/#{title.parameterize}"
  end

  def self.from_param(param)
    param.split('/')
    find_by(title: param.last)
  end

  def year
    created_at.year
  end

  def month
    created_at.month
  end

  def day
    created_at.day
  end

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
  
end
