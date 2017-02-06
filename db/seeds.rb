require 'csv'

products_text = File.read(Rails.root.join('lib', 'seeds', 'products.csv'))
products = CSV.parse(products_text, :headers => true, :encoding => 'ISO-8859-1')

puts products
