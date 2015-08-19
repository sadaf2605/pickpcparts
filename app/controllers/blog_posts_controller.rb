class BlogPostsController < Blogit::PostsController
  helper Blogit::Engine.routes.url_helpers
  def show
    @blog_post=BlogPost.where({:blogit_post_id => params[:id].to_i})[0]
  end
    
  private

    def blog_post_params
      params.require(:blog_post).permit(:blogit_posts_id, :avatar, :build_id)
    end
end

