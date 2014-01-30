class PagesController < ApplicationController

  before_filter :site

  def index
    @pages = @site.pages.order(created_at: :desc)
  end

  def new_page
    @page = @site.pages.new
  end

  def create_page
    @page = @site.pages.new(page_params)
    if @page.save
      redirect_to action: :index
    else
      render action: :new_page
    end
  end

  def edit_page
    @page = @site.pages.find(params[:page_id])
  end

  def update_page
    @page = @site.pages.find(params[:id])
    if @page.update_attributes(page_params)
      redirect_to action: :index
    else
      render action: :edit_page
    end
  end

  private

  def page_params
    params.require(:page).permit(:name, :content)
  end

end
