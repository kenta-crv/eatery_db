class AddColumnToEateries < ActiveRecord::Migration[5.2]
  def change
    add_reference :eateries, :user, foreign_key: true
  end
end
