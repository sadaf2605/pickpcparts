class BuildPost < ActiveRecord::Base

  belongs_to :blogit_post, class_name: "Blogit::Post", :dependent => :delete
  belongs_to :build
  mount_uploader :avatar, ProductImageUploader
  
  accepts_nested_attributes_for :blogit_post
  
  def self.featured_posts
    self.where(:is_featured =>true)
  end
  def to_s
    self.blogit_post.title unless self.blogit_post.nil?
  end

    def method_missing(meth, *args, &block)
      self.blogit_post.send(meth)
    end

end
