module BuildMsg
	def compatible 
		"[compatible]"
	end
	def incompatible
		"[incompatible]"
	end


	def msg_not_attached(part)
		"#{incompatible} #{part} is not attached"
	end
	def msg_socket_supported(part1,part2,socket_name)
      "#{compatible} #{part1} and #{part2} supports CPU socket #{socket_name}"
	end

	def msg_socket_not_supported(supported_part, supported_socket,unsupported_part, unsupported_socket)
      "#{incompatible} #{supported_part} supports socket #{supported_socket} but #{unsupported_part} supports socket #{unsupported_socket}."
  	end
  	def msg_not_checked(part1,part2)
  		"#{compatible} #{part1} #{part2} not checked!"
  	end

  	def msg_memory_type_supported(part1,part2,memory_type)
  		"#{compatible} #{part1} and #{part2} supports memory type #{memory_type}"
  	end
	def msg_memory_type_not_supported(supported_part, supported_memory_type,unsupported_part, unsupported_memory_type)
      "#{incompatible} #{supported_part} supports socket #{supported_memory_type} but #{unsupported_part} supports socket #{unsupported_memory_type}."
  	end

end