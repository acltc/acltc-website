class BlogPic < ActiveRecord::Base
  belongs_to :blog_post
  
  mount_uploader :blog_pic, BlogPicUploader
end
