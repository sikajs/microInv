class RenameLastDetailUpdateToUpdatedAt < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.rename :last_detail_update, :updated_at
    end
  end
end
