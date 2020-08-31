FactoryBot.define do
  factory :item do
    merchant
    name { Faker::Food.spice }
    description { Faker::Food.spice }
    unit_price { Faker::Commerce.price }
  end
end
