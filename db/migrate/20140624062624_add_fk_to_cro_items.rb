class AddFkToCroItems < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE cro_items
            ADD CONSTRAINT cro_id_FK
            FOREIGN KEY (cro_id)
            REFERENCES cros(id)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE cro_items
            DROP FOREIGN KEY cro_id_FK
        SQL
      end
    end
  end
end
