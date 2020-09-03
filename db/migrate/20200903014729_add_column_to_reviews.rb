class AddColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :day, :string
  end
end
