class BuildPostsController < Blogit::PostsController
 # helper Blogit::Engine.routes.url_helpers
  def show
    @blog_post=BuildPost.find(params[:id].to_i)
  end

  def index
    @blog_posts=BuildPost.all()
  end

  def featured_builds
  	@blog_posts=BuildPost.all()
    respond_to do |format|
      format.html
    end
  end

  private

    def blog_post_params
      params.require(:blog_post).permit(:blogit_posts_id, :avatar, :build_id)
    end
end

