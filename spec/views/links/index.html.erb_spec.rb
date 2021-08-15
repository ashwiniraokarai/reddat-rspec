require "rails_helper"

RSpec.describe "links/index.html.erb" do
  context "if the url is an image" do
    it "renders the image inline" do
      FactoryBot.create(:link, url: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg")
      FactoryBot.create(:link, url: "https://someimage.jpg")
      links = Link.all

      assign(:links, links)
      render

      expect(rendered).to have_selector("img[src='#{links.first.url}']")
    end
  end
end
