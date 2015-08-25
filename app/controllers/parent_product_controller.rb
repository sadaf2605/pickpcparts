class ParentProductController < ApplicationController
  
  protect_from_forgery :except => :index
  # GET /cpus
  # GET /cpus.json
  def index
      @grid = eval("#{self.controller_name.classify.pluralize}Grid").new(params["#{self.controller_name}_grid".to_sym]) do |scope|
        scope.page(params[:page])
      end
      respond_to do |format|
        format.html
        format.js { render :template => "parent_products/index.js.erb"}
      end
  end
end