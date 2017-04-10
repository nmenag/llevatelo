class RemoveConstraintnullsToUser < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :email, true
    change_column_null :users, :phone, true
  end
end
