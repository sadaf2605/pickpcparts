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
    sequence(:name){|n| ["LGA775","LGA1155","LGA1156","LGA1366","LGA2011"][n%5] }
  end
  
    trait :without_product do
      product nil
    end
    trait :with_market_status do
      association :product, factory: :product_with_single_market_status
    end

  
  factory :cpu, :class => Cpu do
  #  association :product, factory: :product
    #association :cpu_socket, factory: :cpu_socket
    after(:build) do |s|

      s.cpu_socket = CpuSocket.all[ Cpu.count % CpuSocket.count] || create(:cpu_socket)
   
    end
    association :product, factory: :product     
    
    sequence(:model){|n| "Core i5-469#{n}K"} 
    
    sequence(:data_width){|n| ["64-bit","32-bit"][n%2]}

    sequence(:speed){|n| "3.#{n}GHz"} 
     
    cores 4
    l1_cache "4 x 32KB Instruction 4 x 32KB Data" 
    l2_cache "4 x 256KB"
    l3_cache "1 x 6MB"
    lithography "22 nm"
    thermal_design_power "88 Watts"
    includes_cpu_cooler true
    hyper_threading false
    integrated_graphics "Intel HD Graphics 4600"

    trait :without_socket do
      socket =nil      
    end

    factory :cpu_without_product,    traits: [:without_product]
    factory :cpu_with_market_status,    traits: [:with_market_status]
    factory :cpu_without_socket,    traits: [:without_socket]
#    factory :cpu_with_product, traits[:with_product]

#    trait :with_product_with_single_market_status  do
#      association :product, factory: :build_with_market_status
#    end 

#    factory :cpu_with_single_product_market_status, traits[:product_with_single_market_status]
  end

  
  factory :cooler, class: Cooler do
    association :product, factory: :product, manufacturer: "Cooler Master"

    after(:build) do c
      CpuSocket.all.each do |s|
        c.cpu_sockets << s
      end
    end
    
    liquid_cooled "No"
    radiator_size "Sleeve"
    noise_level "9.0 - 36.0 dbA"
    fan_rpm "600 - 2000 RPM"

    factory :cooler_without_product, traits: [:without_product]
    factory :cooler_with_market_status, traits: [:with_market_status]

  end

  factory :memory, class: Memory do
    association :product, factory: :product
    
    speed ""
    size ""
    price_gb ""
    cas ""
    voltage ""
    heat_spreader true
    ecc true
    registered true
    color "blue"

    #t.integer  "memory_slot_id"

    factory :memory_without_product, traits: [:without_product]
    factory :memory_with_market_status, traits: [:with_market_status]
    
  end

  factory :motherboard, class: Motherboard do 
    association :product, factory: :product

    chipset ""
    memory_type ""
    max_memory ""
    raid_support true
    onboard_video ""
    crossfire_support true
    sli_support true
    sata_6_gbs 2
    onboard_ethernet ""
    onboard_usb_3_headers true
    memory_slot_num 2

    factory :motherboard_without_product, traits: [:without_product]
    factory :motherboard_with_market_status, traits: [:with_market_status]



#    t.integer  "cpu_socket_id"
#    t.integer  "memory_slot_id"
#    t.integer  "form_factor_id"

  end

  factory :storage, :class => Storage do 
    association :product, factory: :product

    capacity ""
    interface ""
    cache ""
    form_factor ""
    ssd_controller ""
    nand_flash_type ""
    gb_1 ""
    price_gb ""

    factory :storage_without_product, traits: [:without_product]
    factory :storage_with_market_status, traits: [:with_market_status]

  end

  factory :video_card, :class => VideoCard do 
    association :product, factory: :product    
    interface ""
    chipset ""
    memory_size ""
    memory_type ""
    core_clock ""
    tdp ""
    fan true
    sli_support true
    dvi_d_dual_link 1
    display_port 1
    hdmi 1
    length 1.4
    crossfire_support true

    factory :video_card_without_product, traits: [:without_product]
    factory :video_card_with_market_status, traits: [:with_market_status]

  end

  factory :power_supply, :class => PowerSupply do
    association :product, factory: :product

    power_supply_type ""
    wattage ""
    fans 2
    modular true
    efficiency_certification ""
    efficiency ""
    output ""
    pci_express_6_plus_2_pin_connectors ""

    factory :power_supply_without_product, traits: [:without_product]
    factory :power_supply_with_market_status, traits: [:with_market_status]

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

    factory :cpu_case_without_product, traits: [:without_product]
    factory :cpu_case_with_market_status, traits: [:with_market_status]

  end
    
end