class BlogPost < ActiveRecord::Base
  has_many :post_featurizations
  has_many :featured_posts, through: :post_featurization


  belongs_to :blogit_post, class_name: "Blogit::Post"
  belongs_to :build
  mount_uploader :avatar, ProductImageUploader
  
    accepts_nested_attributes_for :blogit_post
  def self.featured_posts
    self.where(:is_featured =>true)
  end
  def to_s
    self.blogit_post.title unless self.blogit_post.nil?
  end

end
