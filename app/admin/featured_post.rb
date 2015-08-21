ActiveAdmin.register_page "featuredpost" do
  #menu url: "/admin/featured_posts/#{FeaturedPost.singleton_instance.id}/edit"


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  
  
  content do
    div do
      h2 "Currently featuring..."
      featured=BlogPost.where({is_featured:true})
      
      featured.each do |b|
        li do 
          p b.blogit_post.title
        end
      end
    end    
    
  render "product_form"
  div do
    form :method=> "post" do |f|
      active_admin_form_for FeaturedPost.new do |f|
                  f.has_many :blog_posts, for: [:blog_posts,  BlogPost.new], allow_destroy: true do |a|
                    a.input :blogit_post
                  end
                  f.submit  
          end
      end
    end
  end  
    page_action :add_event, method: :post do
      blogit_posts=params["featured_post"]["blog_posts_attributes"].values.map{|s| s["blogit_post_id"]}
      blogit_posts.each do |blog_id|
        b=BlogPost.find_by_blogit_post_id(blog_id.to_i)
        b.is_featured=true
        b.save
      end
    redirect_to admin_featuredpost_path, notice: "Featurd post updated"
  
    end
  
end

class FakeActiveRecord < ActiveRecord::Base
  def self.columns
    @columns ||= [];
  end

  def self.column(name, sql_type = nil, default = nil, null = true)
    @columns ||= [];
    @columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default,
      sql_type.to_s, null)
  end

  # Override the save method to prevent exceptions.
  def save(validate = true)
    validate ? valid? : true
  end
end
class FeaturedPost < FakeActiveRecord
  column :rank
  has_many :blog_posts  
  accepts_nested_attributes_for :blog_posts
end