require 'rails_helper'


# As a user
# Given that a link has already been submitted
# When I visit the home page
# Then I should see the link's title on the page
# And it should link to the correct URL

RSpec.feature "User visits homepage" do
  scenario "sees the link they submitted" do
    link = FactoryGirl.create(:link)   #alternately you can simply call create since its loaded into the global context
    visit root_path

    expect(page).to have_link link.title, href: link.url
  end
end
