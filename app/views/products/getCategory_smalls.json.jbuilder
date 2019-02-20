json.array! @category_smalls.each do |category_smalls|
  json.id category_smalls.id
  json.name category_smalls.name
end
