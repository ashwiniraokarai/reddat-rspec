class Link < ApplicationRecord
  validates :url, presence: true

  def upvote
    #an alternative/ abstraction to update(upvotes: upvotes + 1)
    increment!(:upvotes)
  end

  def downvote
    increment!(:downvotes)
  end

  def score
    upvotes - downvotes
  end
end
