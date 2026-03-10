require 'rails_helper'

RSpec.describe Parada, type: :model do
  context 'Associations' do
    it { is_expected.to have_many(:carona_paradas) }
    it { is_expected.to have_many(:caronas).through(:carona_paradas) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
