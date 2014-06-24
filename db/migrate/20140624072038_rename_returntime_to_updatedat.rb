class RenameReturntimeToUpdatedat < ActiveRecord::Migration
  def change
    change_table :cros do |t|
      t.rename :return_time, :updated_at
    end
  end
end
