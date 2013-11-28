class Post < ActiveRecord::Base
  belongs_to :user

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :addressings, dependent: :destroy
  has_many :user_recipients, through: :addressings, source: :recipient, source_type: 'User'

  validates_presence_of :text, :user

  def recipients
    # join by type
    user_recipients
  end

  def recipients= recipients
    # split by type
    self.user_recipients = recipients
  end

  def recipient_ids
    recipients.map do |recipient|
      {type: recipient.class.to_s, id: recipient.id, name: recipient.name}
    end
  end

  def recipient_ids= list
    type_lists = {}
    list.each do |identifier|
      type_lists[identifier['type']] ||= []
      type_lists[identifier['type']] << identifier['id']
    end

    type_lists.each do |type, ids|
      send "#{type.downcase}_recipient_ids=", ids
    end
  end

  def serialized_recipient_ids
    recipient_ids.to_json
  end

  def serialized_recipient_ids= params
    self.recipient_ids = JSON.parse params
  end
end
