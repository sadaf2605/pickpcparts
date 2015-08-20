class DropTablePostFeaturizations < ActiveRecord::Migration
  def change
    drop_table :post_featurizations
  end
end
