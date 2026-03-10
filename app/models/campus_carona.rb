class CampusCarona < ApplicationRecord
  belongs_to :carona
  belongs_to :campus
  validates :carona, :campus, :role, presence: true
  validate :verify_campus_active

  enum role: { departure: 'departure', destination: 'destination' }
 
  def verify_campus_active
    return if campus.nil?
    if campus.deactivation_date.present?
      errors.add(:base, :campus_deactivated, title: campus.title)
    end
  end
 
end
