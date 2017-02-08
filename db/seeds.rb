require 'csv'

### Inventory ###

# read in inventory as a string
inventory_text = File.read('lib/seeds/inventory.csv').tr(' ', '')

# parse as comma separated file
inventory = CSV.parse(inventory_text,
  { headers: true,
    converters: :numeric,
    header_converters: :symbol
  })

# loop through rows and seed Inventory table
inventory.each do |row|
  Inventory.create!(row.to_hash)
end

### Products ###

# read in products as a string
products_text = File.read('lib/seeds/products.csv').tr('"', '')

# parse as comma separated file
products = CSV.parse(products_text,
  { col_sep: ';',
    headers: false,
    quote_char: '"',
    encoding: Encoding::UTF_8
  })

# shift off headers
products.shift

formattedProducts = []
#format products
products.each do |product|
  product = product.join(',').split(" ")

  firstThreeColumns = product[0..1]
  middleColumn = product[2]
  lastColumn = product[3..-1]

  formattedProducts << firstThreeColumns.push(lastColumn)
end

#loop through nested array of products
formattedProducts.each do |row|
  newProduct = Product.new
  newProduct.product_id = row[0]
  newProduct.product_name = row[1]
  newProduct.product_image = row[2]
  newProduct.product_description = row[3]
  newProduct.save
end
