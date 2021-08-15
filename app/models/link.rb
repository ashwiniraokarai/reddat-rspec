class Link < ApplicationRecord
  validates :url, presence: true

  IMAGE_FORMATS = [".jpg", ".png", ".gif"]

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

  #Refresher: Why class method? In ORM, Tables map to Classes (Model) whereas rows map to Objects, columns map to Object Attributes
  #We want all the rows in this Table sorted, which requires access to the all rows in the Tables
  #therefore it makes sense that sort operation occurs as a CLASS method, and not an instance method
  def self.hottest_first
    #intuition said I should reuse the score method to calculate upvotes - downvotes here but score itself isn't an attribute
    #plus, its an instance method (meant for Object/ single table row) that is not in the scope of a class method (meant for rows on Table)
    #wrapping the operation in Arel.sql due to danger alert from rails and discontinued support in Rails v > 6
    order(Arel.sql("upvotes - downvotes DESC"))
  end

  def image?
    #equivalent of url.ends_with? (".jpg") || url.ends_with? (".png") || url.ends_with? (".gif")
    #the "splat" operator can make an array into several arguments
    url.end_with? *IMAGE_FORMATS
  end
end
