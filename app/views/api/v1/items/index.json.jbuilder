json.items do
  json.array! @items do |item|
    json.extract! item, :name, :description, :price
  end
end
