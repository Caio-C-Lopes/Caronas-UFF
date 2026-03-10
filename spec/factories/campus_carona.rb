FactoryBot.define do
  factory :campus_carona do
    association :carona
    association :campus
    role { :departure }

    trait :departure do
      role { :departure }
    end

    trait :destination do
      role { :destination }
    end
  end
end