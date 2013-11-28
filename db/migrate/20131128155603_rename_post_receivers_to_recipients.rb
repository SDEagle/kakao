class RenamePostReceiversToRecipients < ActiveRecord::Migration
  def change
    rename_column :addressings, :receiver_id, :recipient_id
    rename_column :addressings, :receiver_type, :recipient_type
  end
end
