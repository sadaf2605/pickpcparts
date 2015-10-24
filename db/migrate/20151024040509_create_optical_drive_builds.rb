class CreateOpticalDriveBuilds < ActiveRecord::Migration
  def change
    create_table :optical_drive_builds do |t|
      t.integer :optical_drive_id
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
