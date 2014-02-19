json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :company, :email, :contact_phone, :street, :city, :state, :zip
  json.url customer_url(customer, format: :json)
end
