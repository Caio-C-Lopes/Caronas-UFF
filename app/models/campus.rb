class Campus < ApplicationRecord
  has_many :campus_caronas, dependent: :destroy
  has_many :caronas, through: :campus_caronas
  validates :title, presence: true, uniqueness: { case_sensitive: true }
  validates :address, :neighborhood, :city, :number, presence: true
  validates :cep, presence: true, format: { with: /\A\d{8}\z/, message: "%{value} não é um CEP válido" }
  
  scope :finder, lambda { |q| where("lower(title) like lower(:q)", q: "%#{q}%").order(:title).limit(20)}
 
  def carona_exists?
    return campus_caronas.exists?
  end

  def can_delete?
    return false if carona_exists?
    true
  end

  def set_deactivate_date
    return false if carona_exists?
    update(deactivation_date: Date.today)
  end

  def set_activate_date
    update(deactivation_date: nil)
  end

  def as_json(options)
    { id: title, text: title }
  end

end
