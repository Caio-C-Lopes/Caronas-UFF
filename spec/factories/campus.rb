FactoryBot.define do
  factory :campus do
    sequence(:title) { |n| "Campus #{n}" }
    address { Faker::Address.full_address }
    number { Faker::Number.between(from: 1, to: 9999) }
    neighborhood { Faker::Address.street_name } 
    city { Faker::Address.city }
    cep { Array.new(8) { rand(10) }.join }

    factory :campus_deactivated do
      deactivation_date { Date.current }
    end

  end
end