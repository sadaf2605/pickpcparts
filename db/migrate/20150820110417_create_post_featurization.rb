class CreatePostFeaturization < ActiveRecord::Migration
  def change
    create_table :post_featurizations do |t|
      t.integer :featured_post_id
      t.integer :blog_post_id
      t.integer :rank
    end
  end
end
