class LinksController < ApplicationController

  def index
    @links = Link.hottest_first
    render ( @links )
  end

  def new
    @link = Link.new
    render ( @link )
  end

  def create
    @link = Link.new(permitted_params)

    if @link.save
      redirect_to @link
    else
      render ( :new )
    end
  end

  def show
    @link = Link.find(params[:id])
    render ( @link )
  end

  private

  def permitted_params
    params.require(:link).permit(:title, :url)
  end

end
