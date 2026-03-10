require 'rails_helper'

RSpec.describe Campus, type: :model do
  context 'Associations' do
    it { is_expected.to have_many(:campus_caronas).dependent(:destroy) }
    it { is_expected.to have_many(:caronas).through(:campus_caronas) }
  end

  context 'Model validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:cep) }
    it { is_expected.to validate_uniqueness_of(:title) }

    context 'when validating CEP format' do
      it { is_expected.to allow_value('12345678').for(:cep) }
      it { is_expected.not_to allow_value('1234567').for(:cep) }
      it { is_expected.not_to allow_value('123456789').for(:cep) }
      it { is_expected.not_to allow_value('1234567f').for(:cep) }
    end
  end

  describe '#carona_exists?' do
    context 'when there are no caronas' do
      it 'returns false' do
        campus = create(:campus)
        expect(campus.carona_exists?).to be false
      end
    end

    context 'when there are caronas' do
      it 'returns true' do
        campus = create(:campus)
        create(:carona_with_departure_as_parameter, departure_campus: campus)
        expect(campus.carona_exists?).to be true
      end
    end
  end

  describe '#can_delete?' do
    context 'when there are no caronas' do
      it 'returns true' do
        campus = create(:campus)
        expect(campus.can_delete?).to be true
      end
    end
 
    context 'when there are caronas' do
      it 'returns false' do
        campus = create(:campus)
        create(:carona_with_departure_as_parameter, departure_campus: campus)
        expect(campus.can_delete?).to be false
      end
    end
  end

  describe '#set_deactivate_date' do
    context 'when there are no caronas' do
      it 'sets deactivation_date to today' do
        campus = create(:campus)
        campus.set_deactivate_date
        expect(campus.deactivation_date).to eq(Date.today)
      end
    end

    context 'when there are caronas' do
      it 'returns false' do
        campus = create(:campus)
        create(:carona_with_departure_as_parameter, departure_campus: campus)
        expect(campus.set_deactivate_date).to be false
      end
    end
  end

  describe '#set_activate_date' do
    it 'turns deactivation_date to nil' do
      campus = create(:campus_deactivated)
      campus.set_activate_date
      expect(campus.deactivation_date).to be_nil
    end
  end
end