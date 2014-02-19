json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :company, :upc_code, :website, :description
  json.url product_url(product, format: :json)
end
