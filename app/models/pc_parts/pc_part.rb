class PcPart < ActiveRecord::Base
  self.abstract_class = true
    
    belongs_to :product
  
    
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
         end
 #      end
       return report  
    end
       

end