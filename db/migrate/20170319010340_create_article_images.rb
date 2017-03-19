class CreateArticleImages < ActiveRecord::Migration[5.0]
  def change
    create_table :article_images do |t|
      t.references :article, foreign_key: true, null: false
      t.string :image_file_name, null: false
      t.timestamps
    end
  end
end
