require "rails_helper"


RSpec.describe LinksController, "#create" do
  context "when the link is invalid" do
    it "re-renders the form" do

      # Make a POST request to the LinksController#create method with an invalid link as its payload
      # For the payload, we need hash attributes nesed under the link key
      post(:create, { params: { link: attributes_for(:link, :invalid) } })

      #controller specs expose a request response object
      #note: this assertion only tests that the correct form is rendered
      #It is not the equivalent of the feature spec that tests that error message appears on the page
      expect(response).to render_template(:new)
    end
  end
end
