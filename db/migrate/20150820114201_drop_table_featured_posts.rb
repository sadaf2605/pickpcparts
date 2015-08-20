class DropTableFeaturedPosts < ActiveRecord::Migration
  def change
    drop_table :featured_posts
  end
end
