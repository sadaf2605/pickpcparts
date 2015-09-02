class CreateProductPictures < ActiveRecord::Migration
  def change
    create_table :product_pictures do |t|
      t.integer :picture_id
      t.integer :product_id
    end
  end
end
