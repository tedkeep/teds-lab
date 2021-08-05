class IndexController < ApplicationController
  BLOG = Blog.new(root: Rails.root.join('app', 'blog_posts'), cache: Rails.env.production?)

  def index
    @posts = BLOG.posts.first(3)
  end
end
