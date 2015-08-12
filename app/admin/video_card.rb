ActiveAdmin.register VideoCard do


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
            f.semantic_fields_for [:product, f.object.product || Product.new] do |p|
          p.input :manufacturer
          p.input :part_no 
          p.input :avatar, :as => :file, :hint => image_tag(f.object.product.avatar) if not f.object.product.nil?
      
            p.has_many :market_statuses, for: [:market_statuses,  p.object.market_statuses || MarketStatus.new],allow_destroy: true do |a|
              a.input :price
              a.inputs :shop
            end
          end
      
      input :interface
      input :chipset
      
      input :memory_size
      input :memory_type
      input :core_clock
      input :tdp
      input :fan
      input :sli_support
      input :dvi_d_dual_link
      input :display_port
      input :hdmi
      input :length
    end
    actions
  end


  controller do
    def create
      @video_card = VideoCard.new(video_card_params)
#      @video_card.product = Product.create(product_params)
      @video_card.build_with_market_status(params)
        respond_to do |format|
          if @video_card.save
            format.html { redirect_to [:admin, @video_card], notice: 'Video Card was successfully created.' }
          else
            format.html { render renderer_for(:edit) }
          end
        end
      end
      
     def video_card_params
        params.require(:video_card).permit(:manufacturer, :part_no, :interface, :chipset, :memory_size, :memory_type, :core_clock, :tdp, :fan, :sli_support, :crossfire_support, :dvi_d_dual_link, :display_port, :hdmi)
      end
      def product_params
        params[:video_card][:product].permit(:manufacturer, :part_no)
      end
  end


end
