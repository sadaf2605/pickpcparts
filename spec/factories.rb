FactoryGirl.define do   
  sequence(:random_price) do |n|
    @random_rankings ||= (1..10).to_a.shuffle
    @random_rankings[n]
  end
  
  factory :admin_user, :class => AdminUser do
    sequence(:email){|n| "email#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory  :blogit_post, :class => Blogit::Post do
    association :blogger, factory: :admin_user #, last_name: "Writely"
    
    sequence(:title){|n| "this is super cool title #{n}"}
    body "this is super duper cool body this is super duper cool body this is super duper cool body." 
    state "published" 
    description "this is super duper cool body this is super duper cool body this is super duper cool body." 
  end
  
  factory  :blog_post, :class => BlogPost do
    association :blogit_post, factory: :blogit_post
    is_featured true
  end
  
  
  
  
  factory :shop, :class => Shop do
    name "AB inc."  
  end



  factory :market_status, :class => MarketStatus do
    association :shop, factory: :shop
    price { generate(:random_price) }
  end

  factory :product, :class => Product do
    manufacturer "Intel"
    
    trait :market_status do

      after(:build) do |product|
        create(:market_status, product: product)
      end
    end

    factory :product_with_single_market_status,    traits: [:market_status]
    
  end
  
  factory :cpu_socket, :class => CpuSocket do
    name "LGA1150"
  end
  

  
  factory :cpu, :class => Cpu do
  #  association :product, factory: :product
   
    #association :cpu_socket, factory: :cpu_socket
    after(:build) do |s|
      s.cpu_socket  = CpuSocket.first  || create(:cpu_socket)
    end
     
    model "Core i5-4690K"
    data_width "64-bit"
    speed "3.5GHz"
    cores 4
    l1_cache "4 x 32KB Instruction 4 x 32KB Data" 
    l2_cache "4 x 256KB"
    l3_cache "1 x 6MB"
    lithography "22 nm"
    thermal_design_power "88 Watts"
    includes_cpu_cooler true
    hyper_threading false
    integrated_graphics "Intel HD Graphics 4600"

    trait :with_product do
      association :product, factory: :product
    end
    trait :with_market_status do
      association :product, factory: :product_with_single_market_status
    end

    factory :cpu_with_product,    traits: [:with_product]
    factory :cpu_with_market_status,    traits: [:with_market_status]


#    factory :cpu_with_product, traits[:with_product]

#    trait :with_product_with_single_market_status  do
#      association :product, factory: :build_with_market_status
#    end 

#    factory :cpu_with_single_product_market_status, traits[:product_with_single_market_status]

  end
  


  factory :form_factor, :class => FormFactor do
      name "Mini ITX"
  end
 
  factory :cpu_case, :class => CpuCase do
    association :product, factory: :product
    
    #association :form_factor, factory: :form_factor
    after(:build) do |s|
      s.form_factor  = FormFactor.first  || create(:form_factor)
    end

    color "black"
    includes_power_supply false
    external_5_25_bays 1
    internal_2_5_bays 1
    internal_3_5_bays 3
    front_panel_usb_3_0_ports true
    maximum_video_card_length "13.50\""
    case_type "Mini ITX Tower"
    length 9.37
    width 8.07
    height 14.88
  end
    
end