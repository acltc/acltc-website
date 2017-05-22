class SitemapsController < ApplicationController
  layout nil
  def index
    headers['Content-Type'] = 'application/xml'
    respond_to do |format|
      format.xml {@posts = BlogPost.all}
    end
  end
end
