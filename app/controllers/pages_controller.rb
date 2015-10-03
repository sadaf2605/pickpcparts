class PagesController < ApplicationController
  layout "front_page"
    def front
      @feat_posts = BuildPost.where({is_featured:true})
      @week_post = PostOfTheWeek.order("date").last.build_post
      @build = Build.all[0]        
    end
    
    def about
      
    end
end
