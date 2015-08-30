FactoryGirl.define do 
  

  
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
    price 100
    association :shop, factory: :shop
    #association :product, factory: :product
  end

  factory :product, :class => Product do
    manufacturer "Intel"
    
    factory :product_with_market_status do
      after(:create) do |product|
        create(:market_status, product: product)
      end
    end
    
  end
  
  factory :cpu_socket, :class => CpuSocket do
    name "LGA1150"
  end
  

  
  factory :cpu, :class => Cpu do
    association :cpu_socket, factory: :cpu_socket
       association :product, factory: :product_with_market_status
    
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
    
    factory :cpu_with_market_status do
       association :product, factory: :product_with_market_status
    end

  end
    
end