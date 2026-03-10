require 'rails_helper'

RSpec.describe CampusCarona, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:carona) }
    it { is_expected.to belong_to(:campus) }
  end

  describe 'Model Validations' do
    it { is_expected.to validate_presence_of(:carona) }
    it { is_expected.to validate_presence_of(:campus) }
    it { is_expected.to validate_presence_of(:role) }
  end

  describe '#verify_campus_active' do
    context 'when campus is active' do
      it 'is valid' do
        carona = create(:carona_with_departure_as_campus)
        campus_carona = carona.campus_caronas.find_by(role: :departure)
        campus_carona.verify_campus_active
        expect(campus_carona.errors[:base]).to be_empty
      end
    end

    context 'when campus is deactivated' do
      it 'is not valid' do
        deactivated_campus = create(:campus_deactivated)
        carona = build(:carona_with_departure_as_parameter, departure_campus: deactivated_campus)
        campus_carona = carona.campus_caronas.first
        campus_carona.verify_campus_active
        expect(campus_carona.errors[:base]).to include(I18n.t(
          'activerecord.errors.models.campus_carona.attributes.base.campus_deactivated',
          title: deactivated_campus.title))
      end
    end    
  end

end