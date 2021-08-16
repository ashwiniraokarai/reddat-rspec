require "rails_helper"

RSpec.describe LinkHelper, "#formatted_score" do
  it "returns a formatted score for the link object" do
    #don't need to persist to the db, so skip FactoryBot
    link = Link.new(upvotes: 5, downvotes: 1)

    expect(formatted_score(link)).to eq("4 (+5, -1)")
  end
end
