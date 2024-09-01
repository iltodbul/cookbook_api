class ModifyIngredientsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :ingredients, :createdon, :created_at
    rename_column :ingredients, :modifiedon, :updated_at
    rename_column :ingredients, :isdeleted, :is_deleted
    rename_column :ingredients, :deletedon, :deleted_at

    remove_column :ingredients, :trial471, :string

    add_index :ingredients, :is_deleted
  end
end
