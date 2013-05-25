class RemoveTagAttributeFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :tag, :string
  end
end
