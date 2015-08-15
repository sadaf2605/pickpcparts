class CreateFeaturedPosts < ActiveRecord::Migration
  def change
    create_table :featured_posts do |t|

      t.timestamps null: false
    end
  end
end
