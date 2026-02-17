require "rails_helper"

RSpec.describe CaronasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/caronas").to route_to("caronas#index")
    end

    it "routes to #new" do
      expect(get: "/caronas/new").to route_to("caronas#new")
    end

    it "routes to #show" do
      expect(get: "/caronas/1").to route_to("caronas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/caronas/1/edit").to route_to("caronas#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/caronas").to route_to("caronas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/caronas/1").to route_to("caronas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/caronas/1").to route_to("caronas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/caronas/1").to route_to("caronas#destroy", id: "1")
    end
  end
end
