# coding: utf-8

require "csv"

csv_data1 = CSV.read('db/category.csv', headers: true)
csv_data2 = CSV.read('db/size.csv', headers: true)

csv_data1.each do |row|
  Category.create!(row.to_hash)
end

csv_data2.each do |row|
  Size.create!(row.to_hash)
end
