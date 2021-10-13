require "rails_helper"
require 'email_spec'
require "email_spec/rspec"

RSpec.describe LinkMailer, "#new_link" do
  it "sends email with appropriate data" do
    link = FactoryBot.build(:link)

    email = LinkMailer.new_link(link)

    expect(email).to deliver_to("moderators@example.com")
    expect(email).to deliver_from("from@example.com")
    expect(email).to have_subject("A new link was submitted")
    expect(email).to have_body_text("A new link has been posted")
  end
end
