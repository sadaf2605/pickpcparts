class FeaturedPost < ActiveRecord::Base
  has_many :post_featurizations
  has_many :blog_posts, through: :post_featurization
  
  validate :ensure_singleton, on: :create
  def ensure_singleton
    errors.add('Maximum of one featured post') if  FeaturedPost.all().length > 0
  end
  
  def self.singleton_instance
    if self.all().count >0
      self.all()[0] 
    else
      self.create
    end
  end
    
end
