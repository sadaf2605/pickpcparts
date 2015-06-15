class AddStorageIdToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :builds, :string
    add_column :builds, :storage_id, :integer
  end
end
