class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:manufacturer, :part_no)
    end
end

