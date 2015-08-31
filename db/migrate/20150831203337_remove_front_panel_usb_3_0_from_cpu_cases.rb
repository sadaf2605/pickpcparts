class RemoveFrontPanelUsb30FromCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :front_panel_usb_3_0, :string
  end
end
