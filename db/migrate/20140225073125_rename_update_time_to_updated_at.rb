class RenameUpdateTimeToUpdatedAt < ActiveRecord::Migration
  def change
    rename_column :orders, :update_time, :updated_at
  end
end
