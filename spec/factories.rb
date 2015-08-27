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
end