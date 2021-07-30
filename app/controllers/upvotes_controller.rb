class UpvotesController < ApplicationController
  def create
    link = Link.find(params[:link_id])
    link.upvote

    #You don't need the Upvote action to lead to different page than the user is already on
    redirect_back(fallback_location: root_path)
  end
end
