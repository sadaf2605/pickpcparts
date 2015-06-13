class CreateCoolers < ActiveRecord::Migration
  def change
    create_table :coolers do |t|
      t.string :manufacturer
      t.string :part_no
      t.boolean :liquid_cooled
      t.string :radiator_size
      t.string :noise_level
      t.string :fan_rpm

      t.timestamps null: false
    end
  end
end
