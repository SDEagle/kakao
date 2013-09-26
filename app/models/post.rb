class Post < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :text, :user
end
