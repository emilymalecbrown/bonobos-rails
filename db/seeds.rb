require 'csv'

### Inventory ###

# read in inventory as a string
def seed_inventory
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
end

### Products ###

def read_products
  products_text = File.read('lib/seeds/products.csv').tr('"', '')
  products = CSV.parse(products_text,
  {
    headers: false,
    quote_char: '"',
    encoding: Encoding::UTF_8
  })
  return products
end


def format_products
  products = read_products

  products.shift

  formattedProducts = []
  #format products
  products.each do |product|
    product = product.join(',').split(" ")

    pid = product[0].split(",")[0]
    pname = product[0].split(",")[1] + " " + product[1].chomp(",")
    pimage = product[2].split(",")[0]
    pdescription = product[3..-1].join(" ")

    formattedProducts << [pid, pname, pimage, pdescription]
  end
  return formattedProducts
end

def seed_products
  formattedProducts = format_products

  formattedProducts.each do |row|
    newProduct = Product.new
    newProduct.product_id = row[0]
    newProduct.product_name = row[1]
    newProduct.product_image = row[2]
    newProduct.product_description = row[3]
    newProduct.save
  end
end

seed_inventory
seed_products
