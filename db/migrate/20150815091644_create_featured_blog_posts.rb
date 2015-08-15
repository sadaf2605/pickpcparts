class CreateFeaturedBlogPosts < ActiveRecord::Migration
  def change
    create_table :featured_blog_posts do |t|

      t.timestamps null: false
    end
  end
end
