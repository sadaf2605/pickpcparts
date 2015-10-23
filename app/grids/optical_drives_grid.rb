class OpticalDrivesGrid

  include Datagrid

  scope do
    OpticalDrive
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)

  column(:id)
  #column(:name)
  column(:created_at) do |model|
    model.created_at.to_date
  end
end
