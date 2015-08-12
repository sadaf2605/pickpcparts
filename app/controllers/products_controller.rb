class ProductsController < InheritedResources::Base

public
    def self.product_params(p=params)
      p.require(:product).permit(:manufacturer, :part_no, :avatar)
    end
end

