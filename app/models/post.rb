
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


  # belongs_to  :user
  # has_many :tags, :dependent => :destroy


end

