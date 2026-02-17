class CaronaParada < ApplicationRecord
  belongs_to :carona
  belongs_to :parada
  accepts_nested_attributes_for :parada, reject_if: :all_blank, allow_destroy: true

  def parada_attributes=(attributes)
    self.parada = Parada.find_or_create_by(title: attributes[:title])
  end
 
end
 