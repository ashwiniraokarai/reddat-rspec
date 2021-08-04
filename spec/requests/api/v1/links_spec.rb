require "rails_helper"

RSpec.describe "get api/v1/links" do
  it "returns a list of submitted links sorted hottest first" do
    coldest_link = FactoryBot.create(:link, title: "coldest_link", upvotes: 3, downvotes: 3)
    hottest_link = FactoryBot.create(:link, title: "hottest_link", url: "http://www.hottestlink.com", upvotes: 5, downvotes: 1)
    lukewarm_link = FactoryBot.create(:link, title: "lukewarm_link", upvotes: 4, downvotes: 2)

    get api_v1_links_path

    expect(response.code).to eq("200")
    expect(JSON.parse(response.body).count).to eq 3
    expect(JSON.parse(response.body)[0]["id"]).to eq(hottest_link.id)

    expect(JSON.parse(response.body)[0]).to eq({
      #forced to use hash rockets syntax vs the new hash syntax because keys are not symbols
      "id" => hottest_link.id,
      "title" => hottest_link.title,
      "url" => hottest_link.url,
      "upvotes" => hottest_link.upvotes,
      "downvotes" => hottest_link.downvotes
      })
  end
end
