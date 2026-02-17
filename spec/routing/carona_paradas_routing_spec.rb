require "rails_helper"

RSpec.describe CaronaParadasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/carona_paradas").to route_to("carona_paradas#index")
    end

    it "routes to #new" do
      expect(get: "/carona_paradas/new").to route_to("carona_paradas#new")
    end

    it "routes to #show" do
      expect(get: "/carona_paradas/1").to route_to("carona_paradas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/carona_paradas/1/edit").to route_to("carona_paradas#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/carona_paradas").to route_to("carona_paradas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/carona_paradas/1").to route_to("carona_paradas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/carona_paradas/1").to route_to("carona_paradas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/carona_paradas/1").to route_to("carona_paradas#destroy", id: "1")
    end
  end
end
