
	def parts_inputs_for(m,form)
    	render "admin/product", f:form

    	yield

		columns=m.columns.map{|c| c.name}
		columns=columns.select{|s| !(s.end_with?"_id" or s.end_with?"_at" or s=="id") }
		columns.each do  |a|
        	input a
      	end
    end

    def add_remove_links(add_path,remove_path,item)
		link_to(sanitize('<i class="fa fa-plus"></i>'),add_path, :class => "button", title: "add #{item} to this list" ) + link_to(sanitize('<i class="fa fa-minus"></i>'), remove_path, :class => "button",title:"Remove #{item} from this list" )
	end