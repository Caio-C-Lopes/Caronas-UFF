require "rails_helper"

RSpec.describe CampiController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/campi").to route_to("campi#index")
    end

    it "routes to #new" do
      expect(get: "/campi/new").to route_to("campi#new")
    end

    it "routes to #show" do
      expect(get: "/campi/1").to route_to("campi#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/campi/1/edit").to route_to("campi#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/campi").to route_to("campi#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/campi/1").to route_to("campi#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/campi/1").to route_to("campi#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/campi/1").to route_to("campi#destroy", id: "1")
    end
  end
end
