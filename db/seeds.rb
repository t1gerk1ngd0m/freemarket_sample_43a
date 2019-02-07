# coding: utf-8

require "csv"

csv_data = CSV.read('db/category.csv', headers: true)
csv_data.each do |row|
  Category.create!(row.to_hash)
end
