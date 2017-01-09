class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :boolean, null: false, default: false
    add_column :users, :role, :integer, null: false
    add_column :users, :phone, :string, null: false
  end
end
