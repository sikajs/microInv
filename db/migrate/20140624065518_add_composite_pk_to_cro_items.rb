class AddCompositePkToCroItems < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE cro_items
            ADD CONSTRAINT croItems_PK
            PRIMARY KEY (cro_id, item_id)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE cro_items
            DROP CONSTRAINT croItems_PK
        SQL
      end
    end
  end
end
