FactoryGirl.define do

  factory :product do
    sequence(:name) { |n| "ネコ #{n}"}
    sequence(:description) { |n| "ネコじゃらし #{n}"}
    category_large 1
    category_middle 1
    category_small 1
    brand "ネコ"
    size 1
    shipping_charges_burden 1
    dispatch_area 1
    shipping_method 1
    number_of_the_days_to_ship 1
    price "10000"
    condition 1
    status 0
  end
end
