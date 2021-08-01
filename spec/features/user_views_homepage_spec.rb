require 'rails_helper'


# As a user
# Given that a link has already been submitted
# When I visit the home page
# Then I should see the link's title on the page
# And it should link to the correct URL

RSpec.feature "User visits homepage" do
  scenario "sees submitted links" do
    link = FactoryBot.create(:link)   #alternately you can simply call create since its loaded into the global context
    visit root_path

    expect(page).to have_link link.title, href: link.url
  end

  scenario "sees previously submitted links sorted by highest to lowest score" do
    coldest_link = FactoryBot.create(:link, title: "Coldest", upvotes: 3, downvotes: 3)
    hottest_link = FactoryBot.create(:link, title: "Hottest", upvotes: 5, downvotes: 1)
    mediocre_link = FactoryBot.create(:link, title: "Mediocre", upvotes: 4 , downvotes: 2)

    visit root_path

    expect(page).to have_css("#links li:nth-child(1)", text: "Hottest")
    expect(page).to have_css("#links li:nth-child(2)", text: "Mediocre")
    expect(page).to have_css("#links li:nth-child(3)", text: "Coldest")
  end
end
