class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :parent_group, index: true

      t.timestamps
    end
  end
end
