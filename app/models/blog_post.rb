class BlogPost < ActiveRecord::Base
  belongs_to :blogit_post, class_name: "Blogit::Post"
  belongs_to :build
  mount_uploader :avatar, ProductImageUploader
  
  def self.featured_posts
    self.where(:is_featured =>true)
  end
  def to_s
    self.blogit_post.title unless self.blogit_post.nil?
  end

end
