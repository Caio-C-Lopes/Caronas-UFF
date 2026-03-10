require 'rails_helper'

RSpec.describe CaronaParada, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:carona) }
    it { is_expected.to belong_to(:parada) }
  end

  describe 'Model Validations' do
    it { is_expected.to validate_presence_of(:carona) }
    it { is_expected.to validate_presence_of(:parada) }
  end

end
