
	def parts_inputs_for(m,form)
    	render "admin/product", f:form

    	yield

		columns=m.columns.map{|c| c.name}
		columns=columns.select{|s| !(s.end_with?"_id" or s.end_with?"_at" or s=="id") }
		columns.each do  |a|
        	input a
      	end
    end
