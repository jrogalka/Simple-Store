require "csv"

# Destroy all previous database entries to prevent conflict.
Product.destroy_all
Category.destroy_all

#Loop through CSV rows
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |product|

    category = Category.find_or_create_by(name: product["category"])

    if category && category.valid?
      p = category.products.create(
        title: product["name"],
        description: product["description"],
        price: product["price"],
        stock_quantity: product["stock quantity"]
      )

      puts "Invalid Product #{product["title"]}" unless p&.valid?
    else
      puts "Invalid category #{product["category"]} for product #{product.title}"
    end
end

puts "Created #{Category.count} categories."
puts "Created #{Product.count} products."

# Used for creating the 676 fake products using faker.

# 676.times do
#   product = Product.create(title: Faker::Commerce.unique.product_name, price: Faker::Commerce.price, stock_quantity: Faker::Number.within(range: 1..100))
#   product.save
# end
