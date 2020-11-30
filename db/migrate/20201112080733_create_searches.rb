class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :first_name
      t.string :last_name
      t.string :tel
      t.string :number_of_times
      t.string :cancel
      t.timestamps
    end
  end
end
