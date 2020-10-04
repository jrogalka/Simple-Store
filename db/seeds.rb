require "csv"

676.times do
  product = Product.create(title: Faker::Commerce.unique.product_name, price: Faker::Commerce.price, stock_quantity: Faker::Number.within(range: 1..100))
  product.save
end
