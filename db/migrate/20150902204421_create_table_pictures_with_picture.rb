class CreateTablePicturesWithPicture < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture
    end
  end
end
