class CreateAddressings < ActiveRecord::Migration
  def change
    create_table :addressings do |t|
      t.references :post, index: true
      t.references :receiver, polymorphic: true

      t.timestamps
    end
  end
end
