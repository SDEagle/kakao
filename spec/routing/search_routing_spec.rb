require "spec_helper"

describe SearchController do
  describe "routing" do

    it "routes to tag search" do
      get("/search/tags").should route_to("search#tags")
    end

  end
end
