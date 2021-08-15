require "rails_helper"


RSpec.describe LinksController, "#create" do
  context "when the link is invalid" do
    it "re-renders the form" do

      # Make a POST request to the LinksController#create method with an invalid link as its payload
      # For the payload, we to pass a hash of attributes nesed under the link key
      link_params = FactoryBot.attributes_for(:link, :invalid)
      post(:create, { params: { link: link_params } } )

      #controller specs expose a request response object
      #note: this assertion only tests that the correct form/ route is rendered
      #It is not the equivalent of the feature spec that tests that error message appears on the page
      expect(response).to render_template(:new)
    end
  end
end
