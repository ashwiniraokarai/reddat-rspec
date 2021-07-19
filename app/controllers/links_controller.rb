class LinksController < ApplicationController
  
  def index
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(permitted_params)
    redirect_to @link
  end

  def show
    @link = Link.find(params[:id])
  end

  private

  def permitted_params
    params.require(:link).permit(:title, :url)
  end

end
