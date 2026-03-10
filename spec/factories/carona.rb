FactoryBot.define do
  factory :carona do
    driver_name { Faker::Name.name }
    passengers_number { Faker::Number.between(from: 1, to: 10) }
    cost { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    date_time { Faker::Time.forward(days: 10) }
    sequence(:departure) { |n| "Departure #{n}" }
    sequence(:destination) { |n| "Destination #{n}" }
    obs { nil }

    trait :with_departure_as_campus do
      after(:build) do |carona|
        campus = create(:campus)
        carona.campus_caronas << build(:campus_carona, :departure, carona: carona, campus: campus)
      end
    end

    trait :with_destination_as_campus do
      after(:build) do |carona|
        campus = create(:campus)
        carona.campus_caronas << build(:campus_carona, :destination, carona: carona, campus: campus)
      end
    end

    trait :with_departure_and_destination_as_campus do
      after(:build) do |carona|
        campus_departure = create(:campus)
        campus_destination = create(:campus)
        carona.campus_caronas << build(:campus_carona, :departure, carona: carona, campus: campus_departure)
        carona.campus_caronas << build(:campus_carona, :destination, carona: carona, campus: campus_destination)
      end
    end

    trait :with_departure_as_parameter do
      transient do
        departure_campus { nil }
      end

      after(:build) do |carona, evaluator|
        carona.campus_caronas << build(:campus_carona, :departure, carona: carona, campus: evaluator.departure_campus)
      end      
    end

    #apenas para build (banco não salva)
    trait :without_campus_carona do
    end

    factory :carona_with_departure_as_campus, traits: [:with_departure_as_campus]
    factory :carona_with_destination_as_campus, traits: [:with_destination_as_campus]
    factory :carona_with_departure_and_destination_as_campus, traits: [:with_departure_and_destination_as_campus]
    factory :carona_with_departure_as_parameter, traits: [:with_departure_as_parameter]
    factory :carona_without_campus_carona, traits: [:without_campus_carona]

  end
end