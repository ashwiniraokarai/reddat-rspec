require 'rails_helper'

# As a user
# Given that there is at least one submitted link
# When I visit the home page
# And I upvote a link
# Then I see an increased score

RSpec.feature "User upvotes a link" do
  scenario "they see an increased score" do
    link = FactoryGirl.create(:link)
    visit root_path

    # predict the construct of the html for the link element produced by content_tag_for
    # content_tag_for creates an HTML element with id and class parameters that relate to the specified Active Record object

    # at this point I realizd I needed a build a few things in order for the rest of the functionality to work (upvote, score) to work:
    # the underlying logic and the html elements that will need to be hooked up to this logic
    # So I built the functionality driven by model specs, and the html element befire returning to this spec
    # Do model specs and return to this test after
    within "#link_#{link.id}" do
      click_on "Upvote"
    end

    # expect score shown on page to go up by 1
    # upvote is a method on the model responsible for incrementing upvotes (an attribute) count when called on
    # This functionality is tested at the model spec level. Same with downvote method,
    # Score is just a method that returns the diff between the two counts.
    # That way we limit this feature spec to validate what we see visibly on the screen i.e,
    # the score value as seen on the html element which represents it. Not the actual method on the model behind it thet determines the value.
    expect(page).to have_css("#link_#{link.id}"), text: 1
  end
end
