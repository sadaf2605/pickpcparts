class CreateShop < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :location
      t.string :contact
    end
  end
end
