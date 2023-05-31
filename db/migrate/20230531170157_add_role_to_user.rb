class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, null: false, foreign_key: true, :default => 1
  end
end