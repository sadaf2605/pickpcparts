class AddMemoryIdToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :memory_id, :integer
  end
end
