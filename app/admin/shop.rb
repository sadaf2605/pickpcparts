ActiveAdmin.register Shop do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
 permit_params :name, :location, :contact
  form(:html => { :multipart => true })  do |f|
    f.inputs do
        input :name
        input :location
        input :contact
        input :avatar, :as => :file, :hint => image_tag(f.object.avatar)
        
    end
  end
end
