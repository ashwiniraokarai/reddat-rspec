class LinksController < ApplicationController
  def index
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(title: params[:link][:title], url: params[:link][:url])
    redirect_to @link
  end

  def show
    @link = Link.find(params[:id])
  end

end
