
class Post < ActiveRecord::Base
  acts_as_taggable
  mount_uploader :photo, PhotoUploader

  # belongs_to :tags

  #   def tag_list
  #     tag.try(:tag)
  #   end

  #   def tag_list=(name)
  #     self.tag = Tag.find_by_name(name) if name.present?
  #   end

  # auto_html_for :url do
  #   html_escape
  #   image
  #   youtube(:width => 400, :height => 250, :autoplay => true)
  #   link :target => "_blank", :rel => "nofollow"
  #   simple_format
  # end
# after_save :enqueue_image
  
  def photo_name
    File.basename(photo.path || photo.filename) if photo
  end

  # def enqueue_photo
  #   ImageWorker.perform_async(id, key) if key.present?
  # end

  # class ImageWorker
  #   include Sidekiq::Worker
    
  #   def perform(id, key)
  #     post = Post.find(id)
  #     post.key = key
  #     post.remote_photo_url = post.photo.direct_fog_url(with_path: true)
  #     post.save!
  #     postupdate_column(:photo_processed, true)
  #   end
  # end
end






