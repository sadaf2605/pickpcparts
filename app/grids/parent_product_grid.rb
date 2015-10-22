class ParentProductGrid
  include Datagrid
  
  def self.scope_and_columns(url_columns,mandatory_columns)
    filters=self.scope.columns.select {|s| !s.name.to_s.end_with? "_at" and s.name != "id" }
    #filters.delete("id")

    filters.each do |c|

      if c.type == :integer
          filter(c.name,:integer,:range => true)
      else
        filter(c.name, c.type) do |value|
            where("#{c.name} LIKE '%#{value}%'")      
        end
      end

      
      if url_columns.include? c.name.to_sym
        column(c.name,:mandatory =>true, :url => lambda {|model| "#{self.scope.to_s.downcase.pluralize}/#{model.id}" })
      else


        column(c.name,:mandatory => if mandatory_columns.include? c.name.to_sym then true else false end)

      end
      
    end
    
       column_names_filter(:header => "Extra Columns", checkboxes: true)
   end
  

end