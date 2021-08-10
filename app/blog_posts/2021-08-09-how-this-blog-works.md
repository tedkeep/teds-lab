# How this blog works

Full disclosure - I didn't build the core functionality of this blog system. I came across this implementation over at [ruby-toolbox.com/blog](https://www.ruby-toolbox.com/blog) and thought it was super simple and succinct. Exactly what I was looking for to build upon. 

So I've cloned it here with the plan to improve on it to make it more robust and rich with features. I explain my plans to add features further down. Before that, it's helpful to see how the blog system works.

## Core functionality

The blog system all starts with creating a new `Blog` instance in the relevant controller. For example, the `BlogController` contains the following:

    BLOG = Blog.new(root: Rails.root.join('app', 'blog_posts'), cache: Rails.env.production?) 

When creating a new 'blog', the root folder where the blog posts markdown files are contained, and whether they should be cached are set. Helpful on the live app.

To then access the blog posts, in a controller route, `BlogController#index` for example, you would use the following line:

    @posts = BLOG.posts

The `#posts` method calls a private method which will load the posts and order them:

    def load_posts
        posts = []
        Dir[root.join('*.md')].each do |path|
            posts << PostLoader.new(path: path).post
        end
        posts.sort_by(&:title).reverse.sort_by(&:published_on).reverse
    end

Notice in that method it is using a `PostLoader`. This class is used to manage the loading of each blog post found in the specified root blog post folder.

It does this by setting the meta data (blog title, published date, etc.) from the markdown files content and the file name. The filename for this post is `2021-08-09-how-this-blog-works.md`.

To explain one part of this data building, the published date is found by the two following methods:

    def published_on
        Date.parse(path_data[1])
    end
    
    private
    
    def path_data
      @path_data ||= File.basename(path).match(/(\d{4}-\d{2}-\d{2})-([^.]+)/)
    end

So it's important to set the markdown files name correctly. If it's not formatted correctly it will cause issues when trying to retrieve the meta data.

Methods like `#published_on` are called on the `PostLoader#post` method to build the `Post` object.

    def post
        Post.new(
            published_on: published_on,
            permalink: permalink,
            title: title,
            body_html: body_html
        )
    end

So going full circle, the following line retrieves a collection of `Post` objects. Then used to display the data in the view:

    @posts = BLOG.posts

An implementation that is simple to use and comprehend.

## Improvements

Whilst I love the simpleness of the system, it does lack some features that I would like. However, it does offer a great foundation to build upon so I can add these features myself in the near future. These features include:

* **tags** - I want to be able to tags (or hashtags) so it's easier to see what subjects or technoligies each blog post is covering. This should be possible to add so that the `PostLoader` class can find it in the markdown files content.
* **Code syntax highlighting** - The system uses [Redcarpet](https://github.com/vmg/redcarpet), a markdown renderer gem, to render the markdown into HTML. However it doesn't syntax highlight any code blocks which makes it a little harder to read. This should be solveable by adding a Redcarpet plugin called [Rouge](https://github.com/rouge-ruby/rouge) although more research will be needed on it.
* **A chapter section** - Much like the [RoR guides](https://guides.rubyonrails.org/), having a 'chapter' sections on the side allows quicker jumping up and down of the blog post. But can also serve as a way to decrease the width of the post view. Currently it's quite wide and not the best for reading consumption.

## Conclusion

Overall, I'm happy with the blog system in it's current state. It's offered a great place to build upon which I'm looking forward to doing. I'll cover upgrades in future blog posts.

Again, big thank you to Christoph at [ruby-toolbox](https://www.ruby-toolbox.com/) too. 