class RemoveBestsellersDateFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column(:books, :bestsellers_date, if_exists: true)
  end
end
