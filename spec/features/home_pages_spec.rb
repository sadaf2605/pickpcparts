require 'rails_helper'
require 'support/home_page_steps'

RSpec.feature "home page", type: :feature do
  include HomePageSteps
  
  describe "navbar", js:true do
  
    it "shows me navbar" do
      when_i_visit_homepage
      i_see_navbar
    end
    it "does not show me nested menu without navbar menu cick" do
      when_i_visit_homepage
      i_dont_see_navbar_nested_menu
    end
    it "shows me nested menu when navbar menu item when individual item" do  
      when_i_visit_homepage
      
      when_i_click_navbar_menu_individual_parts
      i_see_navbar_nested_menu
    end
    it "shows me nested menu items when I click item" do
      when_i_visit_homepage
      
      when_i_click_navbar_menu_individual_parts
      i_see_individual_parts_menu_items
    end
    
    it "does not show me nested menu when I double click individual item" do
      when_i_visit_homepage
      
      when_i_click_navbar_menu_individual_parts
      
      when_i_click_navbar_menu_individual_parts #again
      i_dont_see_navbar_nested_menu
    end
    

    
  end

  describe "cararousel", :js=>true  do
    it "shows me carousel" do
      when_i_visit_homepage
      i_see_carousel
    end
  end
  
  describe "build steps" do
    it "shs me build steps" do
      when_i_visit_homepage
      i_see_build_steps
    end
  end
    

#  given(:new_product) { Product.new(title: 'Widget Y', description: 'This is another description.', price: 24.95, shipping_price: 2.95) { 

  it "show me facebook like box in 5s", :js=>true do
    when_i_visit_homepage
    when_i_wait 5
    i_see_facebook_like_box
  end
  
  describe "featured posts" do
    it "shows me post when I create a post" do
      when_i_create_feature_post_with_title("this is cool title")
      when_i_visit_homepage
      i_see_featured_post_with_title("this is cool title")
    end
  
    it "does not show me posts when there is no featured post" do
      when_there_is_no_post
      when_i_visit_homepage
      i_see_no_featured_post
    end
    
    it "shows me beautiful message when there is no featured post" do
      when_there_is_no_post
      when_i_visit_homepage
      i_see_featured_build_message "Yet, we don't have any featured post!" 
    end
  end
  
  describe "Weeks pick" do
    it "shows me beautiful message when there is weekly pick"
    it "shows me post when there is a weekly pick"
    it "shows me post when I create one."
  end
  
  

  
  #pending "add some scenarios (or delete) #{__FILE__}"
end
