require "csv"

Product.delete_all
new_product = Product.create(price: 32.23, stock_quantity: 42)

if new_product.valid?
  puts "Valid"
else
  puts "Invalid"
end
