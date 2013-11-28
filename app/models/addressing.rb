class Addressing < ActiveRecord::Base
  belongs_to :post
  belongs_to :recipient, polymorphic: true
end
