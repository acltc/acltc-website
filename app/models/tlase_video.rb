class TlaseVideo < ActiveRecord::Base
  def vimeo_id
    vimeo_url.split("/")[-1]
  end
end
