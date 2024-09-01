class UpdateImageAddedByCookIdToUuid < ActiveRecord::Migration[7.0]
  def up
    # Add the new column of type uuid
    add_column :images, :added_by_cook_id, :uuid

    # Copy the values from the old column to the new one
    execute <<-SQL
      UPDATE images
      SET added_by_cook_id = addedbyuserid::uuid
    SQL

    # Remove the old column
    remove_column :images, :addedbyuserid
  end

  def down
    add_column :images, :addedbyuserid, :string, limit: 450

    execute <<-SQL
      UPDATE images
      SET addedbyuserid = added_by_cook_id::text
    SQL

    remove_column :images, :added_by_cook_id
  end
end
