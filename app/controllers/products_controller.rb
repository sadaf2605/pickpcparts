class ProductsController < InheritedResources::Base

  public
    def self.product_params(p)
      p.require(:product).permit(:manufacturer, :part_no, :avatar, :marker_statuses,:pictures_attributes, "pictures_attributes","0")
    end
end

