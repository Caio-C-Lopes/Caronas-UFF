class CaronaParada < ApplicationRecord
  belongs_to :carona
  belongs_to :parada
  validates :carona, presence: true

  def parada_attributes=(attributes)
    self.parada = Parada.find_or_initialize_by(title: attributes[:title])
  end
 
end
 