class SearchController < ApplicationController
  def search
    @search_key=params[:search]
    @items=[];
    ParentProduct.descendants.each do |a|
        @items<<a.search_for(@search_key)
    end
    
    @items=@items.flatten.uniq
    @items=@items.paginate(:page =>params[:page],:per_page=>5)
    logger.debug @items

  end
  def auto_complete_search
    begin

      @items = []
      ParentProduct.descendants.each do |a|
        #(Object.const_get a.class.name).scoped_search on: (Object.const_get a.class.name).column_names-["id"]
        @items<<a.complete_for(params[:search][:term])
      end
       #@items =Cpu.order(:model).where("model LIKE ?", "'%#{params[:search][:term]}%'")
       #Cpu.complete_for(params[:search][:term])
#      Object.const_get "#{k.camelize}") 
      
      #@items = AdminUser.complete_for(params[:search][:term])
      
      @items = @items.flatten.map do |item|
        category = (['and','or','not','has'].include?(item.to_s.sub(/^.*\s+/,''))) ? 'Operators' : ''
        part = item.to_s.sub(/^.*\b(and|or)\b/i) {|match| match.sub(/^.*\s+/,'')}
        completed = item.to_s.chomp(part)
        {:completed => completed, :part => part, :label => item, :category => category}
      end
    rescue ScopedSearch::QueryNotSupported => e
      @items = [{:error =>e.to_s}]
    end
    logger.debug @items
    render :json => @items #[{:label=>"a"},{:label=>"b"}] #@items
  end
end
