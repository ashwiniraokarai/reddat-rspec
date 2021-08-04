class Api::V1::LinksController < ApplicationController
  def index
    links = Link.hottest_first
    #in the rendered json, skip the timestamp attrs mentioned in the except hash because they are a PITA when validating in specs
    render json: links, :except => [:created_at, :updated_at]
  end
end
