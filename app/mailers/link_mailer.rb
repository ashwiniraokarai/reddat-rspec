class LinkMailer < ApplicationMailer
  def new_link(link)
    @link = link
    mail(to: "moderators@example.com", subject: "A new link was submitted")
  end
end
