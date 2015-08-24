class CpusGrid

  include Datagrid

  scope do
    Cpu
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)

  column(:id)
  column(:model)
  column(:created_at) do |model|
    model.created_at.to_date
  end
end
