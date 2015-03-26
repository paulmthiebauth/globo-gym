class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :name, null: false
      t.string :street, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.string :founding_date
      t.string :phone_number
      t.integer :member_count
      t.timestamps
    end
  end
end
