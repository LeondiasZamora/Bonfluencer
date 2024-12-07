# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.first

# Check if the user exists
if user
  # Create individual reviews for the first user with real data
  Review.create!(
    user: user,
    author: "John Doe",
    content: "I absolutely loved this product! It has made my life so much easier. The quality is top-notch, and the customer service was excellent. Highly recommend!",
    author_image_url: "https://randomuser.me/api/portraits/men/1.jpg",
    confirmed: true
  )

  Review.create!(
    user: user,
    author: "Jane Smith",
    content: "The product is good, but I think it could be improved in a few areas. It works fine, but it took a bit longer to arrive than expected.",
    author_image_url: "https://randomuser.me/api/portraits/women/2.jpg",
    confirmed: false
  )

  Review.create!(
    user: user,
    author: "Michael Johnson",
    content: "Amazing experience overall! The shipping was fast, and the product exceeded my expectations. Would definitely purchase again.",
    author_image_url: "https://randomuser.me/api/portraits/men/3.jpg",
    confirmed: true
  )

  Review.create!(
    user: user,
    author: "Emily Davis",
    content: "I was a bit disappointed. The product didn't match the description exactly. However, the customer service team was helpful in resolving the issue.",
    author_image_url: "https://randomuser.me/api/portraits/women/4.jpg",
    confirmed: true
  )

  Review.create!(
    user: user,
    author: "David Wilson",
    content: "This is a solid product. It's exactly what I needed. Quality is great, and I appreciate the attention to detail.",
    author_image_url: "https://randomuser.me/api/portraits/men/5.jpg",
    confirmed: true
  )

  Review.create!(
    user: user,
    author: "Sophia Martinez",
    content: "The product didn't meet my expectations. It didn't work as advertised, and I had to return it. Not the best experience.",
    author_image_url: "https://randomuser.me/api/portraits/women/6.jpg",
    confirmed: false
  )

  Review.create!(
    user: user,
    author: "James Taylor",
    content: "Excellent quality and great value for the price. This is exactly what I was looking for. Would definitely recommend to friends and family.",
    author_image_url: "https://randomuser.me/api/portraits/men/7.jpg",
    confirmed: true
  )

  Review.create!(
    user: user,
    author: "Olivia Brown",
    content: "The product works fine, but it was a bit tricky to set up initially. After reading the manual, it was much easier to get it working.",
    author_image_url: "https://randomuser.me/api/portraits/women/8.jpg",
    confirmed: true
  )

  Review.create!(
    user: user,
    author: "William Garcia",
    content: "Not satisfied with my purchase. It broke after just a few uses. Customer support was responsive, but it took a while to get a resolution.",
    author_image_url: "https://randomuser.me/api/portraits/men/9.jpg",
    confirmed: false
  )

  Review.create!(
    user: user,
    author: "Ava Anderson",
    content: "I love this product! It has exceeded my expectations. Perfect for what I need, and I use it every day. 10/10 would recommend!",
    author_image_url: "https://randomuser.me/api/portraits/women/10.jpg",
    confirmed: true
  )

  puts "10 individual reviews created successfully for User ##{user.id}"
else
  puts "User not found, unable to create reviews."
end
