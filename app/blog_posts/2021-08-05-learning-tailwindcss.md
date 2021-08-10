# How and why I used Tailwind CSS

## Preface

As someone who struggles with CSS, I set out to look for a framework that helped make it as easy as possible, and offered good documentation resources to refer to - which is something I knew I'd be doing a lot. [Bootstrap](https://getbootstrap.com/) filled this role well however I was having to restyle the Bootstrap "looks" everywhere and I found it more of a pain than a helpful tool.

Coming across [Tailwind](https://tailwindcss.com/) it offered the ease of use I was wanting, albeit in a slightly different fashion to traditional CSS frameworks. Tailwind works by using small classes in the HTML to build up the styling. By keeping all the work within the HTML files it speeds up development and offers a clearer picture as to what CSS is being applied to each section. On top of that, building responsive styling behaviours (a must for any web page these days) is very easy too. The Documentation is also very easy to follow, and no pre styling offers a fresh plate to let me build on.

## Setting up Tailwind with Rails

The setup process was a little confusing at first. The world of PostCSS processors was, and still is, confusing to me. However, with the [official documents](https://tailwindcss.com/docs) and helpful [rails specific tutorials](#references) it turned out to be a fairly simple process. 

Here's how it goes:

### Install

<span class="text-sm">Note: These steps are for TailwindCSS V2, Rails 6 and Webpacker V5. For other versions I recommend checking the [References](#references) below or a quick google around.</span>

Firstly, install TailWindCSS and its dependencies via Yarn.

    yarn add tailwindcss postcss autoprefixer

Next is placing the css file. Because the css file will be handled via JS and Webpacker, a suitable place to put the file is into `/app/javascripts/stylesheets/application.scss` with the following contents:

    /* application.scss */
    @import "tailwindcss/base";
    @import "tailwindcss/components";
    @import "tailwindcss/utilities";`


Then in the `/app/javascript/packs/application.js` file you should import this new css file:

    /* application.js */
    import "stylesheets/application";

The CSS file now needs to be referenced in your view layout(s) (`/app/views/layouts/application.html.erb`):

    <!-- app/views/layouts/application.html.erb -->
    <!DOCTYPE html>
    <html>
        <head>
            <title>TailwindCSS</title>
            <%= csrf_meta_tags %>
            <%= csp_meta_tag %>
            
            <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
            
            <!-- This refers to app/javascript/stylesheets/application.scss -->
            <%= stylesheet_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
            
            <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
        </head>
        ...

Next is to generate the Tailwind config file. This will put the newly created file into the root folder of the app:

    npx tailwindcss init

In my case, I moved this file to the same folder as the Tailwind application.css file (`/appjavascript/stylesheets`).<br> 
A helpful feature of TailwindCSS is to purge any unneeded styling too. This reduces the size of the file in production. This can be done by referencing any files to check in the config:
    
    // tailwind.config.js
    module.exports = {
        purge: [
            "./app/**/*.html.erb",
            "./app/helpers/**/*.rb",
            "./app/javascript/**/*.js",
        ],
        darkMode: false, // or 'media' or 'class'
        theme: {
            extend: {},
        },
        variants: {
            extend: {},
        },
        plugins: [],
    }


Finally, Tailwind should be added to the postcss config file:

    module.exports = {
        plugins: [
            // If you didn't move the Tailwind config file from the root folder then the second parameter is not needed
            require("tailwindcss")("./app/javascript/stylesheets/tailwind.config.js"), 
        ]
    }

And that's it! Now you can start using TailwindCSS in your project. 

## Helpful notes

### Base styles
TailwindCSS uses a set of [base styles](https://tailwindcss.com/docs/preflight) which remove nearly all default styles set by browsers. This is helpful to get a consistent experience across all browsers. However, it's helpful to [override the base styles](https://tailwindcss.com/docs/preflight#extending-preflight) to suit your own needs. Here's an example of how to do this in a Rails app:

    @import "tailwindcss/base";
    @import "tailwindcss/components";
    @import "tailwindcss/utilities";
    
    @layer base {
        h1 {
            @apply font-sans text-4xl md:text-5xl lg:text-6xl font-bold leading-snug mb-5;
        }
    
        h2 {
            @apply font-sans text-xl md:text-2xl font-bold leading-snug mb-5;
        }
        
        h3 {
            @apply font-sans text-lg md:text-xl font-semibold leading-snug mb-5;
        }
    }


### Potential build error

When going to first test your new install you may run into an error: `PostCSS plugin tailwindcss requires PostCSS 8.`<br>
This is a fixable issue explained at the top of [Axel Kee's super helpful install tutorial](https://rubyyagi.com/tailwindcss2-rails6/). He explains it better than I would so follow his guide over there.

## My experience using TailwindCSS 

Going back to what I said at the beginning, I normally struggle with styling pages, especially with building responsive pages. However, with TailwindCSS I've found it a rather enjoyable process as it allowed me to produce (in my opinion) a nicely formatted page. I struggle to pinpoint one exact feature of TailwindCSS which helped me. Rather, I believe it was the culmination of the CSS being written within the HTML file which allowed for quicker experimenting and building, the super easy to implement responsive behaviours, and the insightful and easy to comprehend documentation. The documentation may even be the biggest factor, as it taught me a lot about CSS in general such as `grids` and `flex`, not just the TailwindCSS framework.

I would definitely recommend giving TailwindCSS a go. See if you find any benefits like I have.

## References

* https://rubyyagi.com/tailwindcss2-rails6/
* https://rubyyagi.com/tailwind-css-on-rails-6-intro/
* https://webdevchallenges.com/add-tailwind-to-rails
* https://tailwindcss.com/