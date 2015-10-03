class RenameBlogPosts < ActiveRecord::Migration
   def self.up
    rename_table :blog_posts, :build_posts
  end

 def self.down
    rename_table :build_posts, :blog_posts
 end
end
