class RemoveCaseIdFromBuilds < ActiveRecord::Migration
  def change
    remove_column :builds, :case_id, :string
  end
end
