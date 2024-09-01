class ModifyImagesTable < ActiveRecord::Migration[7.0]
  def change
    change_column :images, :id, :uuid, default: "gen_random_uuid()", null: false

    rename_column :images, :createdon, :created_at
    rename_column :images, :modifiedon, :updated_at
    rename_column :images, :recipeid, :recipe_id
    rename_column :images, :added_by_cook_id, :cook_id
    rename_column :images, :remoteimageurl, :remote_image_url

    remove_column :images, :trial006, :string

    add_foreign_key :images, :recipes, column: :recipe_id, on_delete: :cascade
    add_foreign_key :images, :cooks, column: :cook_id, on_delete: :nullify

    add_index :images, :recipe_id
    add_index :images, :cook_id
  end
end
