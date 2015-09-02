RSpec.shared_examples "a global navbar" do 
	  
  
    it "shows me navbar" do
      i_see_navbar
    end
    it "does not show me nested menu without navbar menu cick" do
      i_dont_see_navbar_nested_menu
    end
    it "shows me nested menu when navbar menu item when individual item" do  
      
      
      when_i_click_navbar_menu_individual_parts
      i_see_navbar_nested_menu_for_individual_parts
    end
    it "shows me nested menu items when I click item" do
      when_i_click_navbar_menu_individual_parts
      i_see_navbar_nested_menu_for_individual_parts
    end
    
    it "does not show me nested menu when I double click individual item" do
      
      when_i_click_navbar_menu_individual_parts
      
      when_i_click_navbar_menu_individual_parts #again
      i_dont_see_navbar_nested_menu
    end
    it "shows me search box when I click search menu" do
      
      when_i_click_navbar_menu_search
      i_see_navbar_nested_menu_for_search
    end
    it "shows does not show me individual item menu nested menu when there is individual nested menu open and i click search" do
      when_i_click_navbar_menu_individual_parts
      when_i_click_navbar_menu_search
      i_dont_see_navbar_nested_menu_for_individual_parts
      i_see_navbar_nested_menu_for_search
    end
    it "shows does not show me search nested menu when there is search nested menu open and i click individual parts menu" do
      when_i_click_navbar_menu_search
      when_i_click_navbar_menu_individual_parts
      i_dont_see_navbar_nested_menu_for_search
      i_see_navbar_nested_menu_for_individual_parts
    end
    
end