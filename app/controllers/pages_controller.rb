class PagesController < ApplicationController
  layout "front_page"
    def front
      @feat_posts = BlogPost.where({is_featured:true})
      @week_post ||= Blogit::Post.for_index.first(1)[0] || Blogit::Post.new
      @build = Build.all[0]        
    end
    
    def about
      
    end
end
