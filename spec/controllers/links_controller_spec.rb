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
      # the fact that we are testing the mailer trigger from the controller BUT creating a "real" link in the process can be considered as dependency
      # In other words, the Link object is only a collaborator which we could avoid exercising in order to keep this controller spec isolated
      # Commenting old code that supplies attributes for creating a real link
      # link_params = FactoryBot.attributes_for(:link)

      # STUBBING: To avoid this, create a setup where when calls are made to Link model's "new" method, return a fake link object (a double)

      #construct a test double (aka mock object)
      valid_link = double(save: true)
      # set up Link model to return a fake link object when calls are made to it's "new" method  ( => return a canned response, in this case a double)
      allow(Link).to receive(:new).and_return(valid_link)
      # set up LinkMailer to call fake/stubbed method new_link
      allow(LinkMailer).to receive(:new_link)

      #perform the action/ exercise the system
      dummy_params = { attribute: "value" }
      post(:create, { params: {link: dummy_params }})

      # expect LinkController#create to call LinkMailer#new_link method
      # in rspec world, you think from the receiving end - expect LinkMailer to have received a call to stubbed "new_link" method
      # said another way, expect "new_link" method of LinkMailer to have been called
      expect(LinkMailer).to have_received(:new_link).with(valid_link)
    end
  end
end
