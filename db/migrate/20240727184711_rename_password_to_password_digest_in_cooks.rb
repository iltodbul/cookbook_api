class RenamePasswordToPasswordDigestInCooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :cooks, :password, :password_digest
  end
end
