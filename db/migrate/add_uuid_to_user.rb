class AddUUIDToUsers < ActiveRecord::Migration
  def up
    add_column :users, :uuid, :uuid, default: "gen_random_uuid()", null: false
    rename_column :users, :id, :guid_id
    rename_column :users, :uuid, :id
    execute "ALTER TABLE users drop constraint pk_aspnetusers;"
    execute "ALTER TABLE users ADD PRIMARY KEY (id);"

    # Optionally you remove auto-incremented
    # default value for integer_id column
    execute "ALTER TABLE ONLY users ALTER COLUMN guid_id DROP DEFAULT;"
    change_column_null :users, :guid_id, true
    execute "DROP SEQUENCE IF EXISTS users_id_seq"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end