require 'rails_helper'

# As a user
# Given that there is an already submitted link
# When I visit the homepage
# And I downvote a link
# Then I see a decreased score

RSpec.feature "User downvotes a link" do
  scenario "they see a decreased score" do
    link = FactoryGirl.create(:link, upvotes: 5)

    visit root_path

    #check score before any action is taken
    expect(page).to have_css("#link_#{link.id}"), text: 0

    within "#link_#{link.id}" do
      click_on "Downvote"
    end

    expect(page).to have_css("#link_#{link.id}"), text: 4
  end
end
