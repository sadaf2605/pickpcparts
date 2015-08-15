class FeaturedBlogPostsController < InheritedResources::Base

  private

    def featured_blog_post_params
      params.require(:featured_blog_post).permit()
    end
end

