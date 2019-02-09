FactoryGirl.define do
  factory :product do
    name "ネコ"
    description "猫じゃらし"
    category_large "メンズ"
    category_middle "トップス"
    category_small "Tシャツ"
    brand "ネコ"
    size "s"
    shipping_charges_burden "送料込み"
    dispatch_area 1
    shipping_method "未定"
    number_of_the_days_to_ship "1~2日で発送"
    price "10000"
    condition "新品、未使用"
  end
end
