class AddColumnToEateries2 < ActiveRecord::Migration[5.2]
  def change
    add_column :eateries, :canonical_name, :string
  end
end
