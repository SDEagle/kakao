class Group < ActiveRecord::Base
  belongs_to :parent_group, class_name: 'Group'
  has_many :sub_groups, class_name: 'Group', dependent: :destroy, foreign_key: 'parent_group_id'

  validates_presence_of :name
end
