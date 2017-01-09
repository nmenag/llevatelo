class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :name, null: false, limit: 100
      t.text :description, null: false
      t.string :location, null: false
      t.boolean :status, null: false, default: false
      t.integer :type, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
