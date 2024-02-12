# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Destroying models'
Product.destroy_all
LineItem.destroy_all
Cart.destroy_all
puts 'Models destroyed'
# . . .
Product.create!(title: 'Design and Build Great Web APIs',
  description:
  %{<p>
  <em>Robust, Reliable, and Resilient</em>
  APIs are transforming the business world at an increasing pace. Gain
  the essential skills needed to quickly design, build, and deploy
  quality web APIs that are robust, reliable, and resilient. Go from
  initial design through prototyping and implementation to deployment of
  mission-critical APIs for your organization. Test, secure, and deploy
  your API with confidence and avoid the “release into production”
  panic. Tackle just about any API challenge with more than a dozen
  open-source utilities and common programming patterns you can apply
  right away.
  </p>},
  image_url: 'maapis.jpg',
  price: 24.95
)
  Product.create!(title: 'Seven Mobile apps in seven weeks',
    description:
    %{Answer the question “Can we build this for ALL the devices?”
    with a resounding YES. Learn how to build apps using seven different
    platforms: Mobile Web, iOS, Android, Windows, RubyMotion, React Native,
    and Xamarin. Find out which cross-platform solution makes the most sense for your needs,
    whether you’re new to mobile or an experienced developer expanding your options.
    Start covering all of the mobile world today.},
    image_url: 'lorem.jpg',
    price: 28.95
  )
  Product.create!(title: 'Docker for rails developers',
    description:
    %{Docker does for DevOps what Rails did for web development—it gives
      you a new set of superpowers. Gone are “works on my machine” woes
      and lengthy setup tasks, replaced instead by a simple, consistent,
      Docker-based development environment that will have your team up and
      running in seconds. Gain hands-on, real-world experience with a tool
      that’s rapidly becoming fundamental to software development. Go from
      zero all the way to production as Docker transforms the massive leap
      of deploying your app in the cloud into a baby step.},
    image_url: 'ridocker.jpg',
    price: 21.95
  )
  Product.create!(title: 'Programming ruby 1.9 & 2.0',
    description:
    %{Ruby is the fastest growing and most exciting dynamic language out there.
      If you need to get working programs delivered fast, you should add Ruby
      to your toolbox.
      This book is the only complete reference for both Ruby 1.9 and Ruby 2.0,
      the very latest version of Ruby.},
    image_url: 'ruby.jpg',
    price: 18.50
  )
  Product.create!(title: 'Modern CSS with Tailwind',
    description:
    %{Tailwind CSS is an exciting new CSS framework that allows you to design
      your site by composing simple utility classes to create complex effects.
      With Tailwind, you can style your text, move your items on the page,
      design complex page layouts, and adapt your design for devices from a
      phone to a wide-screen monitor. With this book, you’ll learn how to use
      the Tailwind for its flexibility and its consistency, from the smallest
      detail of your typography to the entire design of your site.},
    image_url: 'tailwind.jpg',
    price: 22.75
  )
# . . .
