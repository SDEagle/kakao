class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, through: :taggings

  def self.reduce tag_name
    tag_name.gsub(/\p{^Alnum}/, '')
  end
end
