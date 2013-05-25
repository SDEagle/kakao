class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, through: :taggings

  validates_presence_of :name
end
