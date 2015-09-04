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
    
    render "admin/featuredpost/refresh_product_form"

    div do
      @featured_post = FeaturedPost.new
      @featured_post.blog_posts=BlogPost.where({is_featured:true})
      @featured_post.save
      
      form :method=> "post" do |f|
        active_admin_form_for @featured_post do |f|
          f.has_many :blog_posts, for: [:blog_posts,  f.object.blog_posts || BlogPost.new], allow_destroy: true do |a|
            a.input :blogit_post, :input_html => { :disabled => a.object.new_record? ?false:true}
            a.input :priority,     :input_html => {:maxlength => 30, :style => "width:auto", :value=>a.object.priority.nil? ? 0 :a.object.priority}
          end
          f.submit
        end
      end
    end
  end    
  
  page_action :add_event, method: :post do
    blogit_posts=params["featured_post"]["blog_posts_attributes"]
                            .values.map{|s| { :blogit_post_id =>s["blogit_post_id"],
                                              :id             =>s["id"] ? s["id"] : s["i/nd"] ,
                                              :priority       =>s["priority"],
                                              :_destroy       =>s["_destroy"]} }
    blogit_posts.each do |blog_hash|
          if blog_hash[:id]
            b=BlogPost.find(blog_hash[:id].to_i)
            if blog_hash[:_destroy] && blog_hash[:_destroy].to_s=="1"
              b.is_featured=false
            end
            b.save
          end
          
          if blog_hash[:blogit_post_id]
            b=BlogPost.find_by_blogit_post_id(blog_hash[:blogit_post_id].to_i)
            b.is_featured=true
          end
        b.priority =blog_hash[:priority].to_i
        b.save
      end
     redirect_to admin_featuredpost_path, notice: "Featurd post updated "
    end
  #end
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