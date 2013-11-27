class Addressing < ActiveRecord::Base
  belongs_to :post
  belongs_to :receiver, polymorphic: true
end
