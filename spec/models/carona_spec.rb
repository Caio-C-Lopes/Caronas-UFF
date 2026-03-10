require 'rails_helper'

RSpec.describe Carona, type: :model do
  context 'Associations' do
    it { is_expected.to have_many(:campus_caronas).dependent(:destroy) }
    it { is_expected.to have_many(:carona_paradas).dependent(:destroy) }
    it { is_expected.to have_many(:paradas).through(:carona_paradas) }
    it { is_expected.to have_many(:campi).through(:campus_caronas) }
  end

  context 'Model validations' do
    it { is_expected.to validate_presence_of(:driver_name) }
    it { is_expected.to validate_presence_of(:date_time) }
    it { is_expected.to validate_presence_of(:departure) }
    it { is_expected.to validate_presence_of(:destination) }
    it { is_expected.to validate_numericality_of(:cost).is_greater_than_or_equal_to(0) }
  end

  describe '#departure_is_campus?' do
    context 'when departure is a campus' do
      it 'returns true' do
        carona = create(:carona_with_departure_as_campus)
        expect(carona.departure_is_campus?).to be true
      end
    end

    context 'when departure is not a campus' do
      it 'returns false' do
        carona = build(:carona_without_campus_carona)
        expect(carona.departure_is_campus?).to be false
      end
    end
  end

  describe '#destination_is_campus?' do
    context 'when destination is a campus' do
      it 'returns true' do
        carona = create(:carona_with_destination_as_campus)
        expect(carona.destination_is_campus?).to be true
      end
    end

    context 'when destination is not a campus' do
      it 'returns false' do
        carona = build(:carona_without_campus_carona)
        expect(carona.destination_is_campus?).to be false
      end
    end
  end

  describe '#must_have_at_least_one_campus' do
    context 'when there are no campus_caronas' do
      it 'is invalid and launchs an error' do
        carona = build(:carona_without_campus_carona)
        carona.must_have_at_least_one_campus
        expect(carona.errors[:base]).to include(
          I18n.t('activerecord.errors.models.carona.attributes.base.no_valid_campus')
        )
      end
    end

    context 'when there is at least one campus_carona' do
      it 'is valid' do
        carona = create(:carona_with_departure_as_campus)
        carona.must_have_at_least_one_campus
        expect(carona.errors[:base]).to be_empty
      end 
    end
  end
end