ActiveAdmin.register BlogPost do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :blog_post, :blogit_post, :build_id, :avatar, :is_featured, :body,:title, :post, :avatar

  form  do |f|
    f.inputs do
        f.semantic_fields_for [:blogit_post, f.object.blogit_post || Blogit::Post.new] do |p|
            p.input :title
            p.input :body 
        end
        input :build
        input :avatar
     end
     actions
   end

    controller do
      def create
        @blog=BlogPost.new(blog_post_params)
        
        post=Blogit::Post.new
        post.title = params[:blog_post][:post][:title]
        post.body = params[:blog_post][:post][:body]
        post.description = params[:blog_post][:post][:body]
        post.blogger = current_admin_user
        post.save
        
        @blog.blogit_post=post
        
       respond_to do |format|
          if @blog.save
            format.html { redirect_to [:admin, @blog], notice: 'Blog Post was successfully created.' }
          else
            format.html { render :new }
          end
        end
      end
      def blog_post_params
        params.require(:blog_post).permit(:post,:avatar,:build_id)
      end
    end
  end