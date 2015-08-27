module HomePageSteps
  def when_i_visit_homepage
    visit("/")
  end
  def i_see_carousel
    expect(page).to have_selector('.owl-carousel')
    expect(page).to have_selector('.owl-item')
  end
  def i_see_navbar
    expect(page).to have_selector('.navbar')
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
    expect(page).not_to have_selector('.yamm-content',visible:true)
  end
  
  def when_i_click_navbar_menu_individual_parts
    click_on("Individual Parts")
  end
  def when_i_click_navbar_menu_search
    click_on("Search")
  end
  
  def i_see_navbar_nested_menu_for_individual_parts
    expect(page.find('.dropdown',text:"Individual Parts")).to have_selector('.yamm-content')
  end
  def i_dont_see_navbar_nested_menu_for_individual_parts 
      expect(page.find('.dropdown',text:"Individual Parts")).not_to have_selector('.yamm-content')
  end
  def i_see_navbar_nested_menu_for_search
    expect(page.find('.dropdown',text:"Search")).to have_selector('.yamm-content')
  end
  def i_dont_see_navbar_nested_menu_for_search 
    expect(page.find('.dropdown',text:"Search")).not_to have_selector('.yamm-content')
  end

  def i_see_individual_parts_menu_items
    expect(page.find('.yamm-content')).to have_content("CPU")
    expect(page.find('.yamm-content')).to have_content("CPU Cooler")
    expect(page.find('.yamm-content')).to have_content("Mother- board")
    expect(page.find('.yamm-content')).to have_content("Memory")
    expect(page.find('.yamm-content')).to have_content("Storage")
    expect(page.find('.yamm-content')).to have_content("Video Card")
    expect(page.find('.yamm-content')).to have_content("Power Supply")
    expect(page.find('.yamm-content')).to have_content("Case")    
  end
  def i_see_build_steps
    expect(page).to have_content("Build your own PC!")
    
    expect(page).to have_content("Build your own part list with us.")
    expect(page).to have_content("Share your list & take feedback.")
    expect(page).to have_content("Compare prices with other shops.")
    expect(page).to have_content("Then buy your own pc.")

  end
  
  def i_see_facebook_like_box
    expect(page).to have_selector('.fb_iframe_widget')
  end
    
  def when_i_create_feature_post_with_title(title)
    require "factories"
    blog_post=FactoryGirl.create(:blog_post)
    blog_post.blogit_post.title=title
    blog_post.blogit_post.save
    blog_post.save
  end 

  def when_i_create_featured_post_with_title(post_title)
    FactoryGirl.create(:blog_post)
  end
  
  def i_see_featured_post_with_title(post_title)
    expect(page).to have_content(post_title)
  end
  def when_i_wait(second)
    sleep second
  end
  
  def when_there_is_no_post
    BlogPost.destroy_all
  end
  def i_see_featured_build_message(text)
    expect(page.find("#featured_post")).to have_content(text)
  end
  
  def i_see_no_featured_post
        expect(page).not_to have_selector('.featured_posts')
  end
end