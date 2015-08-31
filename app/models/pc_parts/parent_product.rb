class ParentProduct < ActiveRecord::Base
  self.abstract_class = true
  
  belongs_to :product, dependent: :destroy
  
  validates :product, :presence => true
  
  def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
  
  
 

  def self.init
    scoped_search on: self.column_names - ["id"]
  rescue 
    return
   # belongs_to :product
  end
  
  def self.inherited(subclass)
    super
    
    subclass.init
  end
 
    
  
    
    def report(build)
       report=[]
       
       x_supports_methods = self.class.instance_methods.select{|f| f.to_s.start_with?("supports_")}.map{|item| item.to_s.split "supports_" }.flatten.reject{|f| f.eql?""}
       
       x_supports_methods.each do |x_supports_method|
#         if build.class.instance_methods.include? x_supports_method.to_s.pluralize
           build.send(x_supports_method.to_s.pluralize).each do |build_part|
             logger.debug "calling #{self}.supports_#{x_supports_method}  with #{build_part}"
             report << send("supports_#{x_supports_method}", build_part)
             logger.debug "#{send("supports_#{x_supports_method}", build_part)}"
           end
 #        end
       end
       return report  
    end
       
    def build_with_market_status(params)
         key=self.class.name.downcase
         self.product=Product.create(ProductsController.product_params(params[key]))
         self.product.market_statuses =[]
         
         market_statuses=params[key][:product][:market_statuses_attributes]
         if market_statuses.length>0
            market_statuses.sort.map{|k,v| v }.each  do |a|
              self.product.market_statuses << MarketStatus.create(MarketStatusController.market_status_params(a))
            end
         end
    end
end