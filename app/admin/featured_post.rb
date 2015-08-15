ActiveAdmin.register FeaturedPost do


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
  
  permit_params :featured_post, :blog_post_ids
  
    form(:html => { :multipart => true })  do |f|    
            f.inputs do
              f.inputs :blog_posts  
              f.object.blog_posts.each &method(:p)
            end
            actions
    end
    
    controller do
      def update
        @featured_post = FeaturedPost.find(params[:id])
        @featured_post.blog_posts=[]
        params[:featured_post][:blog_post_ids].each do |blog_post_id|
          @featured_post.blog_posts << BlogPost.find_by_id(blog_post_id) unless blog_post_id.empty? 
        end
            respond_to do |format|
        if @featured_post.save
          format.html { redirect_to [:admin,@featured_post], notice: 'Featured post was successfully created.' }
          format.json { render  :show, status: :created, location: @featured_post }
        else
          format.html { render :new }
          format.json { render json: @cpu.errors, status: :unprocessable_entity }
        end
      end
    end  
  end
end