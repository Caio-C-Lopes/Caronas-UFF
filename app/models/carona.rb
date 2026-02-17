class Carona < ApplicationRecord
  has_many :carona_paradas, dependent: :destroy
  has_many :paradas, through: :carona_paradas

  accepts_nested_attributes_for :carona_paradas, reject_if: :all_blank, allow_destroy: true

  validates :driver_name, :date_time, :driver_name, :departure, :destination, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }

  validate :verify_campus

  #active record sort
  def self.ransack_associations(auth_object = nil)
    []
  end

  def verify_campus
    departure_campus = Campus.find_by(title: self.departure)
    destination_campus = Campus.find_by(title: self.destination)

    if !departure_campus && !destination_campus
      errors.add(:base, "O local de partida ou o destino precisam ser um campus válido!")
      return     
    end

    if departure_campus && departure_campus.deactivation_date
      errors.add(:base, "O local de partida precisa ser um campus ativo!")
    end 

    if destination_campus && destination_campus.deactivation_date
      errors.add(:base, "O local de destino precisa ser um campus ativo!")
    end

  end
 
end
