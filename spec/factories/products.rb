FactoryGirl.define do

  factory :product do
    name             "supream"
    description      "ステッカーです"
    category_large   1
    category_middle  1
    category_small   1
    brand            "supream"
    size             1
    shipping_charges_burden 1
    dispatch_area    1
    shipping_method  1
    number_of_the_days_to_ship 1
    price "1000"
    condition        1
  end
end
