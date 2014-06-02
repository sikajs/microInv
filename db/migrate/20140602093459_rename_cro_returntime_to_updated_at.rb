class RenameCroReturntimeToUpdatedAt < ActiveRecord::Migration
  def change
    rename_column :cros, :return_time, :updated_at
  end
end
