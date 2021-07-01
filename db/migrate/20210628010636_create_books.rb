class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :publisher
      t.string :amazon_product_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end