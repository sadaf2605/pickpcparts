json.array!(@featured_blog_posts) do |featured_blog_post|
  json.extract! featured_blog_post, :id
  json.url featured_blog_post_url(featured_blog_post, format: :json)
end
