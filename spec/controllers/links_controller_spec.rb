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

  context "when the link is valid" do
    it "triggers the mailer responsible for emailing the moderator" do
      #the fact that we are testing the mailer trigger from the controller BUT creating a "real" link in the process can be considered as dependency
      #In other words, the Link object is only a collaborator which we could avoid exercising in order to keep this controller spec isolated
      #To avoid this, you could replace it with a double instead and allow it to receive(:new) and return a link object
      link_params = FactoryBot.attributes_for(:link)

      #expect LinkController#create to call LinkMailer#new_link method
      #in rspec world, you think from the receiving end - expect LinkMailer to receive a call to "new_link"
      expect(LinkMailer).to receive(:new_link)

      #the "exercising the system" part of the spec is usually and quite intuitiely written before the assertion..
      #But in here it's the other way around (weird)
      post(:create, { params: {link: link_params }})
    end
  end
end
