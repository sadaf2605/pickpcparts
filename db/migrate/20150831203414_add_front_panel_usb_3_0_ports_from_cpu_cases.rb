class AddFrontPanelUsb30PortsFromCpuCases < ActiveRecord::Migration
  def change
    add_column :cpu_cases, :front_panel_usb_3_0_ports, :boolean
  end
end
