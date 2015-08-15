class FeaturedPost < ActiveRecord::Base
  has_many :blog_posts
  
  validate :ensure_singleton, on: :create
  def ensure_singleton
    errors.add('Maximum of one featured post') if  FeaturedPost.all().length > 0
  end
  
  def singleton_instance
    self.all()[0]
  end
    
end
