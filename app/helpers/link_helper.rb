module LinkHelper
  def formatted_score(link)
    "#{link.score} (+#{link.upvotes}, -#{link.downvotes})"
  end
end
