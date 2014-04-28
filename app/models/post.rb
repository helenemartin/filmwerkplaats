class Post < ActiveRecord::Base

  has_many :posts

  validates :title, presence: true
  validates :type, presence: true
  validates :number_of_taxis, numericality: true

end