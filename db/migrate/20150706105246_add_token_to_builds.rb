class AddTokenToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :token, :string
  end
end
