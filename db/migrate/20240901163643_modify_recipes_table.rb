class ModifyRecipesTable < ActiveRecord::Migration[7.0]
  def change
    # Change the type of addedbyuserid from string to uuid
    add_column :recipes, :cook_id, :uuid

    # Copy the data from the old column to the new one
    execute <<-SQL
      UPDATE recipes
      SET cook_id = addedbyuserid::uuid
    SQL

    # Remove the old column
    remove_column :recipes, :addedbyuserid

    rename_column :recipes, :createdon, :created_at
    rename_column :recipes, :modifiedon, :updated_at
    rename_column :recipes, :isdeleted, :is_deleted
    rename_column :recipes, :deletedon, :deleted_at
    rename_column :recipes, :preparationtime, :preparation_time
    rename_column :recipes, :cookingtime, :cooking_time
    rename_column :recipes, :portionscount, :portions_count
    rename_column :recipes, :categoryid, :category_id
    rename_column :recipes, :originalurl, :original_url

    remove_column :recipes, :trial150, :string

    add_foreign_key :recipes, :cooks, column: :cook_id, on_delete: :nullify
    add_foreign_key :recipes, :categories, column: :category_id

    add_index :recipes, :is_deleted
    add_index :recipes, :cook_id
    add_index :recipes, :category_id
  end
end
