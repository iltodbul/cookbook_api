class UpdateImageIdToUuid < ActiveRecord::Migration[7.0]
  def up
    # Adding a new column of type uuid
    add_column :images, :new_id, :uuid, default: "gen_random_uuid()", null: false

    # Copy the values from the old column
    execute "UPDATE images SET new_id = gen_random_uuid()"

    # Remove the old column
    remove_column :images, :id

    # Rename the new column to the old one
    rename_column :images, :new_id, :id

    # Add primary key
    execute "ALTER TABLE images ADD PRIMARY KEY (id)"
  end

  def down
    add_column :images, :old_id, :string, limit: 450

    execute "UPDATE images SET old_id = id::text"

    remove_column :images, :id
    rename_column :images, :old_id, :id

    execute "ALTER TABLE images DROP CONSTRAINT images_pkey;"
  end
end
