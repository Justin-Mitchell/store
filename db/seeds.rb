require 'ffaker'

def drop_all_the_things
  puts 'DROP ALL THE THINGS!'
  [Product, Category, Customer].map(&:destroy_all)
end

def setup_seed_data
  puts "Loading Development Store Data"
  # CUSTOMERS #
  30.times do |i|
    customer = Customer.create({
      name:             Faker::Name.name,
      company:          Faker::Company.name,
      email:            Faker::Internet.email,
      contact_phone:    Faker::PhoneNumber.phone_number,
      street:           Faker::AddressUS.street_address,
      city:             Faker::AddressUS.city,
      state:            Faker::AddressUS.state,
      zip:              Faker::AddressUS.zip_code,
    })
  end

  # PRODUCTS #
  200.times do |i|
    product = Product.create({
      name:        Faker::BaconIpsum.words.join(' '),
      description: Faker::BaconIpsum.paragraph,
      company:     Faker::Company.name,
      upc_code:    Faker::Identification.drivers_license,
      price:       rand(5..278),
      website:     Faker::Internet.uri('http'),    
    })
  end

  # CATEGORIES #
  @categories = ['electronics', 'womens apparel', 'mens apparel', 'kids apparel', 'youth apparel', 'housewares', 'furniture', 'appliances']
  18.times do |i|
    category = Category.create({
      name:        @categories.sample,
      description: Faker::BaconIpsum.paragraph,
    })
  end
end

case Rails.env
when 'development'
  drop_all_the_things
  setup_seed_data
when 'production'
  # do nothing
end