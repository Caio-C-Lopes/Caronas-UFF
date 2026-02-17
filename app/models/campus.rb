class Campus < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :address, :neighborhood, :city, presence: true
  validates :cep, presence: true, format: { with: /\A\d{8}\z/, message: "%{value} não é um CEP válido" }

  #Tabela Intermediária
  def carona_exists
    Carona.exists?(departure: title) || Carona.exists?(destination: title)
  end

  def can_delete
    return false if carona_exists
    true
  end

  def set_deactivate_date
    return false if carona_exists
    update(deactivation_date: Date.today)
  end

  def set_activate_date
    update(deactivation_date: nil)
  end

end
