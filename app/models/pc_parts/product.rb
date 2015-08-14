class Product < ActiveRecord::Base
  mount_uploader :avatar, ProductImageUploader
  has_many :market_statuses
  accepts_nested_attributes_for :market_statuses, :allow_destroy => true
  
  def self.build_with_market_status(child, params)
      child.product = Product.create(ProductsController.product_params(params))
      
      
      child.product.market_statuses =[]
      market_statuses=params[:product][:market_statuses_attributes]
      logger.debug "\n\n\n\n\n------------------"
      logger.debug market_statuses.sort.map{|k,v| v }.length
      if market_statuses.length>0
        market_statuses.sort.map{|k,v| v }.each  do |a|
     
          child.product.market_statuses << MarketStatus.create(MarketStatusController.market_status_params(a))
        end
      end
  end
  
  
end
