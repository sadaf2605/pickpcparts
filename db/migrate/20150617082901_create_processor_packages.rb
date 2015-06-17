class CreateProcessorPackages < ActiveRecord::Migration
  def change
    create_table :processor_packages do |t|
      t.integer :max_cpu_configuration
      t.integer :TCASE_in_C
      t.float :package_width_in_mn
      t.float :package_length_in_mn
      t.integer :graphics_and_imc_lithography_in_nm
      t.string :low_halogen_options_available

      t.timestamps null: false
    end
  end
end
