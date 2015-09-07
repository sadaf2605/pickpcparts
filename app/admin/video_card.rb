ActiveAdmin.register VideoCard do
  menu parent: "Parts", priority: 5


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


  form do |f|
    
    
    f.inputs do      
      parts_inputs_for(VideoCard,f){
       
      }
    end
    actions
  end


  controller do
    def create
      @video_card = VideoCard.new(video_card_params)
#      @video_card.product = Product.create(product_params)
      @video_card.build_with_market_status(params[:video_card])
      
        respond_to do |format|
          if @video_card.save
            format.html { redirect_to [:admin, @video_card], notice: 'Video Card was successfully created.' }
          else
            format.html { render renderer_for(:edit) }
          end
        end
      end

    def update
      @video_card = VideoCard.find(params[:id])
      @video_card.product.update(ProductsController.product_params(params[:video_card]))
      @video_card.build_with_market_status(params[:video_card])
  
      if @video_card.update_attributes(video_card_params)
        super
      end
    end

      
     def video_card_params
        params.require(:video_card).permit(:manufacturer, :part_no, :interface, :chipset, :memory_size, :memory_type, :core_clock, :tdp, :fan, :sli_support, :crossfire_support, :dvi_d_dual_link, :display_port, :hdmi)
      end
  end


end
