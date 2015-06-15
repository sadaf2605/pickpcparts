class RemoveBuildsFromBuilds < ActiveRecord::Migration
  def change
    remove_column :builds, :builds, :string
  end
end
