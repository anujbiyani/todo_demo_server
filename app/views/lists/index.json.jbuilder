json.array! @lists do |list|
  json.id list.id
  json.name list.name

  json.items list.items do |item|
    json.name item.name
    json.done item.done
  end
end
