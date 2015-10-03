json.array!(@blog_posts) do |blog_post|
  json.extract! blog_post, :id, :blogit_posts_id, :avatar, :build_id
  json.url blog_post_url(blog_post, format: :json)
end
