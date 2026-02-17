# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# db/seeds.rb

Campus.create!([
  {
    title: "Gragoatá",
    address: "R. Prof. Marcos Waldemar de Freitas Reis",
    number: nil,
    neighborhood: "São Domingos",
    city: "Niterói",
    cep: "24210201",
    deactivation_date: nil
  },
  {
    title: "Praia Vermelha",
    address: "R. Passo da Pátria",
    number: "156",
    neighborhood: "São Domingos",
    city: "Niterói",
    cep: "24210240",
    deactivation_date: nil
  },
  {
    title: "Valonguinho",
    address: "R. Mario Santos Braga",
    number: "30",
    neighborhood: "Centro",
    city: "Niterói",
    cep: "24020140",
    deactivation_date: nil
  },
  {
    title: "Escola de Enfermagem",
    address: "R. Dr. Celestino",
    number: "74",
    neighborhood: "Centro",
    city: "Niterói",
    cep: "24020091",
    deactivation_date: nil
  },
  {
    title: "Escola de Direito",
    address: "R. Pres. Pedreira",
    number: "62",
    neighborhood: "Ingá",
    city: "Niterói",
    cep: "24210470",
    deactivation_date: nil
  },
  {
    title: "Faculdade de Economia",
    address: "R. Prof. Marcos Waldemar de Freitas Reis",
    number: nil,
    neighborhood: "São Domingos",
    city: "Niterói",
    cep: "24210201",
    deactivation_date: nil
  },
  {
    title: "Faculdade de Farmácia",
    address: "R. Dr. Mario Vianna",
    number: "523",
    neighborhood: "Santa Rosa",
    city: "Niterói",
    cep: "24241000",
    deactivation_date: nil
  },
  {
    title: "Faculdade de Veterinária",
    address: "Av. Alm. Ary Parreiras",
    number: "507",
    neighborhood: "Icaraí",
    city: "Niterói",
    cep: "24230321",
    deactivation_date: nil
  },
  {
    title: "Instituto de Arte e Comunicação Social",
    address: "R. Prof. Lara Vilela",
    number: "126",
    neighborhood: "São Domingos",
    city: "Niterói",
    cep: "24210590",
    deactivation_date: nil
  }    
])
