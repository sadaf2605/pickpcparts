class AddCaseIdToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :case_id, :integer
  end
end
