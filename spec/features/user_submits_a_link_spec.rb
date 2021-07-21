require 'rails_helper'

RSpec.feature "User submits a link" do
  scenario "they see the page for the submitted link" do
    link_title = "Try this book!"
    link_url = "http://testingrailsbook.com"

    # home page where you can begin link submit workflow. Is also an index page
    visit root_path
    click_on "Submit a new link"

    #goes to a "new" link page where you provide inputs
    fill_in "link_title", with: link_title
    fill_in "link_url", with: link_url
    click_on "Submit"

    # expect to see a show page with a link to the newly saved Link object
    expect(page).to have_link link_title, href: link_url
  end

  context "the form is invalid" do
      scenario "they see a helpful error message" do
        visit root_path
        click_on "Submit a new link"

        fill_in "link_title", with: "Try this other book"
        #skip url input to make the submit invalid
        click_on "Submit"

        #expect form to render with errors
        expect(page).to have_content "Url can't be blank"
      end
  end
end
