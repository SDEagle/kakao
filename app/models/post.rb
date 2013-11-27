class Post < ActiveRecord::Base
  belongs_to :user

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :addressings, dependent: :destroy
  has_many :user_receivers, through: :addressings, source: :receiver, source_type: 'User'

  validates_presence_of :text, :user

  def receivers
    # join by type
    user_receivers
  end

  def receivers= receivers
    # split by type
    self.user_receivers = receivers
  end

  def receiver_ids
    receivers.map do |receiver|
      {type: receiver.class.to_s, id: receiver.id, name: receiver.name}
    end
  end

  def receiver_ids= list
    type_lists = {}
    list.each do |identifier|
      type_lists[identifier['type']] ||= []
      type_lists[identifier['type']] << identifier['id']
    end

    type_lists.each do |type, ids|
      send "#{type.downcase}_receiver_ids=", ids
    end
  end

  def serialized_receiver_ids
    receiver_ids.to_json
  end

  def serialized_receiver_ids= params
    self.receiver_ids = JSON.parse params
  end
end
