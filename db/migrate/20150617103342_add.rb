class Add < ActiveRecord::Migration
  def change
    add_column :processor_graphics, :no_of_displays_supported, :integer
  end
end
