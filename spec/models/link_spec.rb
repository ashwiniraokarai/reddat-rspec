require 'rails_helper'

# commenting off autogenerated lines in spec
# RSpec.describe Link, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


#describe creates a group for the functionlity we describe
#Link is the subject and the string next to it is the behavior (usually method name - in this case upvote)
RSpec.describe Link, "#upvote" do
  it "increments upvotes" do
    #in order for upvotes to be recognized as an attrbute I to needed to add that attribute to the model (via migration)
    #rails generate migration AddUpvotesToLinks upvotes:integer
    #default: 0, null:false (added on generated migration file)
    link = build(:link, upvotes: 1)

    # perform upvote i.e, call upvote method on the link object
    link.upvote

    # expect upvote count of the link to have increase by 1
    expect(link.upvotes).to eq 2
  end
end

RSpec.describe Link, "#downvote" do
  it "increments downvotes" do
    link = build(:link, downvotes: 1)

    link.downvote

    expect(link.downvotes).to eq 2
  end
end

RSpec.describe Link, "#score" do
  it "returns the upvotes minus downvotes" do
    link = build(:link, upvotes: 2, downvotes: 1)

    link.score

    expect(link.score).to eq 1
  end
end

RSpec.describe Link, ".hottest_first" do
  it "returns links sorted from highest score to lowest" do
    coldest = FactoryBot.create(:link, upvotes: 3, downvotes: 3)
    hottest = FactoryBot.create(:link, upvotes: 5, downvotes: 1)
    lukewarm = FactoryBot.create(:link, upvotes: 2, downvotes: 1)

    expect(Link.hottest_first).to eq [hottest, lukewarm, coldest]
  end
end

#test model validations using shoulda-matchers library
RSpec.describe Link, "validations" do
  #equivalent of it { expect(Link.new).to validate_presence_of(:url}
  #equivalent of it { expect(subject).to validate_presence_of(:url}
  #equivalent of it { shoulda validate_presence_of(:url}
  it { is_expected.to validate_presence_of(:url) }
end
