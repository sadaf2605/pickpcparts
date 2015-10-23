class BuildPostsController < Blogit::PostsController
 # helper Blogit::Engine.routes.url_helpers
   layout "front_page"
  def show
    @blog_post=BuildPost.find(params[:id].to_i)
  end

  def index
    @blog_posts=BuildPost.all()
  end

  private

    def blog_post_params
      params.require(:blog_post).permit(:blogit_posts_id, :avatar, :build_id)
    end
end

