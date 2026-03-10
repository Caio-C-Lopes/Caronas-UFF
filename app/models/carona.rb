class Carona < ApplicationRecord
  has_many :campus_caronas, dependent: :destroy
  has_many :carona_paradas, dependent: :destroy
  has_many :paradas, through: :carona_paradas
  has_many :campi, through: :campus_caronas

  accepts_nested_attributes_for :carona_paradas, allow_destroy: true

  validates :driver_name, :date_time, :departure, :destination, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }

  validate :must_have_at_least_one_campus

  #active record sort
  def self.ransack_associations(auth_object = nil)
    []
  end

  def departure_is_campus?
    campus_caronas.departure.any?
  end

  def destination_is_campus?
    campus_caronas.destination.any?
  end

  def must_have_at_least_one_campus
    if campus_caronas.empty?
      errors.add(:base, :no_valid_campus)
    end
  end
  
end
