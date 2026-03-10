class CreateCampusCaronasService
  def initialize(carona)
    @carona = carona
  end

  def call
    @carona.campus_caronas.destroy_all if @carona.persisted?
    build_departure_campus
    build_destination_campus
  end

  def build_departure_campus
    campus = Campus.find_by(title: @carona.departure)
    @carona.campus_caronas.build(campus: campus, role: :departure) if campus
  end
 
  def build_destination_campus
    campus = Campus.find_by(title: @carona.destination)
    @carona.campus_caronas.build(campus: campus, role: :destination) if campus
  end
end