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
    sequence(:manufacturer){|n| ["Intel","AMD"][n%2]}
    
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

  
  factory :cpu_basic, :class => Cpu do
  #  association :product, factory: :product
    #association :cpu_socket, factory: :cpu_socket
   
    association :product, factory: :product     

    factory :cpu do
      
      after(:build) do |s|
        unless CpuSocket.count == 0
          s.cpu_socket = CpuSocket.all[ Cpu.count % CpuSocket.count]
        end
        s.cpu_socket ||= create(:cpu_socket)
      end
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
    end

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

  
  factory :cooler_basic, class: Cooler do
    association :product, factory: :product, manufacturer: "Cooler Master"

    factory :cooler do

    
      cpu_sockets { [create(:cpu_socket),create(:cpu_socket)]}

      
      
      liquid_cooled false
      radiator_size "Sleeve"
      noise_level "9.0 - 36.0 dbA"
      fan_rpm "600 - 2000 RPM"
    end

    factory :cooler_without_product, traits: [:without_product]
    factory :cooler_with_market_status, traits: [:with_market_status]

  end

  factory :memory_slot, class: MemorySlot do 
    sequence(:name){|n| ["204-pin SO-DIMM", "214-pin MicroDIMM","240-pin DIMM","244-pin MiniDIMM","260-pin SO-DIMM","260-pin SO-DIMM","288-pin DIMM"][n % (MemorySlot.count+1)]}
  end

  factory :memory_basic, class: Memory do
    association :product, factory: :product

    factory :memory do

      after(:build) do
        unless MemorySlot.count == 0
          memory_type = MemorySlot.all[ Memory.count % MemorySlot.count]
        end
        memory_type ||= create(:memory_slot)
      end

      speed ""
      size ""
      price_gb ""
      cas ""
      voltage ""
      heat_spreader true
      ecc true
      registered true
      color "blue"
    end

    factory :memory_without_product, traits: [:without_product]
    factory :memory_with_market_status, traits: [:with_market_status]
    
  end

  factory :motherboard_basic, class: Motherboard do 
    association :product, factory: :product

    factory :motherboard do
      after(:build) do
         unless FormFactor.count == 0
          form_factor = FormFactor.all[ Motherboard.count % FormFactor.count+1]
        end
        form_factor ||= create(:memory_slot)
      end

      after(:build) do
        unless CpuSocket.count == 0
          cpu_socket = CpuSocket.all[Motherboard.count % CpuSocket.count+1]
        end
        cpu_socket ||= create(:cpu_socket)
      end


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
    end

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
      sequence(:name){ |n| ["Mini ITX","Pico-ITX","Pico-ITX"][n % (FormFactor.count+1)]}
  end
 
   factory :cpu_case_form_factor_membership, :class => FormFactor do
      association :cpu_case, factory: :cpu_case
      association :form_factor, factory: :form_factor
  end

  factory :cpu_case_basic, :class => CpuCase do
    association :product, factory: :product
    
    factory :cpu_case do
      #association :form_factor, factory: :form_factor
      after(:build) do |c|
        c.form_factors =[create(:form_factor)] 
        #create(:cpu_case_form_factor_membership) { [create(:form_factor),create(:form_factor)]}
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

    factory :cpu_case_without_product, traits: [:without_product]
    factory :cpu_case_with_market_status, traits: [:with_market_status]

  end
    
end