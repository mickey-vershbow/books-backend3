class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      # list details
      t.string :list_name
      t.string :updated
      t.string :bestsellers_date
      t.integer :rank
      t.integer :rank_last_week
      t.integer :weeks_on_list
      # books
      t.string :title
      t.string :author
      t.string :publisher
      t.string :published_date
      t.text :description
      t.string :book_image

      # isbns buy links
      t.string :name
      t.string :url

      # user favorites
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
