class BlogPost < ActiveRecord::Base
  belongs_to :blogit_post, class_name: "Blogit::Post"
  belongs_to :build
  mount_uploader :avatar, ProductImageUploader
  #belongs_to :featured_blog_post
end
