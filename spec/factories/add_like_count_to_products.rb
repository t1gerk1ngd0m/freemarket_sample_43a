# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :add_like_count_to_product do
    like_count 1
  end
end
