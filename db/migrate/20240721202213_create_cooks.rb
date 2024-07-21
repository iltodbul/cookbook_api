class CreateCooks < ActiveRecord::Migration[7.0]
  def change
    create_table :cooks, id: :uuid do |t|
      # t.uuid :id
      t.string :name
      t.boolean :is_deleted
      t.datetime :deleted_at
      t.string :email
      t.string :password
      t.string :phone_number

      t.timestamps
      t.index :is_deleted, name: 'ix_cooks_is_deleted'
    end
  end
end
