module HomePageSteps
  def when_i_visit_homepage
    visit("/")
  end
  def i_see_carousel
    expect(page).to have_selector('.owl-carousel', visible: true)
    expect(page).to have_selector('.owl-item', visible: true)
  end
  def i_see_navbar
    
    expect(page).to have_selector('.navbar', visible: true)
  end
  
  def i_see_navbar_menu_item
    expect(page).to have_content("PCPARTSBD.com")
    expect(page).to have_content("Your Build")
    expect(page).to have_content("Featured Builds")
    expect(page).to have_content("Individual Parts")
    expect(page).to have_content("Blog Posts")
    expect(page).to have_content("About Us")
    expect(page).to have_content("Partner Shops")
    expect(page).to have_content("Search")
  end
  def i_dont_see_navbar_nested_menu
    expect(page).to have_selector('.dropdown-menu', visible: false)
  end
  
  def when_i_click_navbar_menu
    click_link("Individual Parts")
  end
  
  def i_see_navbar_nested_menu
    expect(page).to have_selector('.dropdown-menu', visible: true)
  end
  
  def i_see_build_steps
    expect(page).to have_content("Build your own PC!")
    
    expect(page).to have_content("Build your own part list with us.")
    expect(page).to have_content("Share your list & take feedback.")
    expect(page).to have_content("Compare prices with other shops.")
    expect(page).to have_content("Then buy your own pc.")

  end
  
  def i_see_facebook_like_box
        expect(page).to have_selector('.fb_iframe_widget', visible: false)
  end
end