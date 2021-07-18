require 'rails_helper'

RSpec.feature "User submits a link" do
  scenario "they see the page for the submitted link" do
    link_title = "Try this book!"
    link_url = "http://testingrailsbook.com"

    # home page where submitted links show
    visit root_path
    click_on "Submit a new link"
    #goes to a "new" link page where you provide inputs
    fill_in "link_title", with: link_title
    fill_in "link_url", with: link_url
    click_on "Submit"
    # expect to see a show page with a link to the newly saved Link object
    expect(page).to have_link link_title, href: link_url
  end
end
