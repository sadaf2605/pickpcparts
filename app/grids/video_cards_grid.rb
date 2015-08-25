class VideoCardsGrid < ParentProductGrid
  scope do
    VideoCard
  end
  
  scope_and_columns(url_columns=[:part_no],mandatory_columns=[:interface,:chipset,:memory_size])
  
end