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
 
    
    def method_missing(m, *args, &block)
      
      if m.to_s.include? "supports"
        method = "supports_#{self.class.name.downcase}"

        if args[0].methods.include? method.to_sym
          return args[0].send(method,self) 
        else
          return "[incompatible]#{m.to_s.split("supports")[0]} is not attached"
        end
      end

      super
    end
  
    
    def report(build)
       report=[]
       
       x_supports_methods = self.methods.select{|f| f.to_s.start_with?("supports_")}.map{|item| item.to_s.split "supports_" }.flatten.reject{|f| f.eql?""}
       
       
       x_supports_methods.each do |x_supports_method|
#         if build.class.instance_methods.include? x_supports_method.to_s.pluralize
        
           build.send(x_supports_method.to_s.pluralize).each do |build_part|
             report << self.send("supports_#{x_supports_method}", build_part)
           end
 #        end
       end
       return report  
    end
       
    def build_with_market_status(params)
      key=self.class.name.downcase

        if self.product.nil?
          self.product=Product.create(ProductsController.product_params(params))
        else
          self.product.update_attributes(ProductsController.product_params(params))
        end


        unless params[:product][:pictures_attributes].nil?
         self.product.pictures ||= []
           pictures=params[:product][:pictures_attributes]
           if pictures.length>0
              pictures.sort.map{|k,v| v }.each  do |a|
                if a["_destroy"]=="1" 
                  Picture.find(a["id"]).destroy
                elsif a["_destroy"]=="0" 
                  Picture.find(a["id"]).update_attributes(image: a[:image])
                else
                  self.product.pictures << Picture.create(image: a[:image])
                end
              end
           end
         end
        



        unless params[:product][:market_statuses_attributes].nil?
         self.product.market_statuses ||= []
           market_statuses=params[:product][:market_statuses_attributes]
           if market_statuses.length>0
              market_statuses.sort.map{|k,v| v }.each  do |a|
                if a["_destroy"]=="1" 
                  MarketStatus.find(a["id"]).destroy
                elsif a["_destroy"]=="0"
                  MarketStatus.find(a["id"]).update_attributes(MarketStatusController.market_status_params(a))
                else
                  self.product.market_statuses << MarketStatus.create(MarketStatusController.market_status_params(a))
                end
              end
           end
         end
        end
end