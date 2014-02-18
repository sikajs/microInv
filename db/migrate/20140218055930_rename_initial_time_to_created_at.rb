class RenameInitialTimeToCreatedAt < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.rename :initial_time, :created_at
    end
  end
end
