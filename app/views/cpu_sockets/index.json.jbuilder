json.array!(@cpu_sockets) do |cpu_socket|
  json.extract! cpu_socket, :id, :name
  json.url cpu_socket_url(cpu_socket, format: :json)
end
