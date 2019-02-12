FactoryGirl.define do

  factory :user do
    nickname              "山田SAMURAI"
    email                 "yamada@gmail.com"
    password              "00000000"
    password_confirmation "00000000"
    tel_confirmation      "08011223344"
    first_name            "山田"
    last_name             "太郎"
    first_name_kana       "ヤマダ"
    last_name_kana        "タロウ"
    zip                   "123-4567"
    prefecture            "三重県"
    city                  "山々市"
    block                 "大奥町1-2"
    building              "コペンハーゲンハイツ102"
    phone_number          "0595332211"
    card_number           "4343565688779988"
    expiration_month      "1900-04-01"
    expiration_year       "2020-01-01"
    security_code         "123"
    provider              ""
    uid                   ""
  end
end
