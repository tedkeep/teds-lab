# How I styled this website using Tailwind CSS

## Preface

As someone who struggles with CSS, I set out to look for a framework that helped make it as easy as possible, and offered good documentation resources to refer to - which is something I knew I'd be doing a lot. [Bootstrap](https://getbootstrap.com/) filled this role well however I was having to restyle the Bootstrap "looks" everywhere and I found it more of a pain than a helpful tool.

Coming across [Tailwind](https://tailwindcss.com/) it offered the ease of use I was wanting, albeit in a slightly different fashion to traditional CSS frameworks. Tailwind works by using small classes in the HTML to build up the styling. By keeping all the work within the HTML files speeds up development and offers a clearer picture as to what CSS is being applied. On top of that, building responsive styling behaviours (a must for any web page these days) is very easy too. The Documentation is also very easy to follow, and no pre styling offers a fresh plate to let me build on.

## Setting up Tailwind with Rails

The setup process was a little confusing at first. The world of PostCSS processors was, and still is, confusing to me. However, with the [official documents](https://tailwindcss.com/docs) and helpful [rails specific tutorials](#references) it turned out to be a fairly simple process. 

Here's how it goes:

<span class="text-sm">Note: These steps are for TailwindCSS V2, Rails 6 and Webpacker V5. For other versions I recommend checking the [References](#references) below or a quick google around.</span>

### Install

Firstly, install TailWindCSS and its dependencies via Yarn.

`yarn add tailwindcss postcss autoprefixer`

Next is placing the css file: Place the following into <span class="bg-gray-100 rounded p-1 font-semibold">/app/javascripts/stylesheets/application.scss</span>

`/* application.scss */
@import "tailwindcss/base";
@import "tailwindcss/components";
@import "tailwindcss/utilities";`

## References

* https://rubyyagi.com/tailwindcss2-rails6/
* https://rubyyagi.com/tailwind-css-on-rails-6-intro/