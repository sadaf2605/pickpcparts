class BlogPostsController < InheritedResources::Base

  private

    def blog_post_params
      params.require(:blog_post).permit(:blogit_posts_id, :avatar, :build_id)
    end
end

