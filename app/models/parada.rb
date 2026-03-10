class Parada < ApplicationRecord
  has_many :carona_paradas
  has_many :caronas, through: :carona_paradas 
  validates :title, presence: true, uniqueness: { case_sensitive: true }
end 
