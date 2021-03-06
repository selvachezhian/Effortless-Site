class SitesController < ApplicationController

  def index
    @sites = Site.order(:created_at).page params[:page]
  end

  def new_site
    @site = Site.new
  end

  def create_site
    @site = Site.new(site_params)
    if @site.save
      redirect_to action: :index
    else
      render action: :new_site
    end
  end

  def edit_site
    @site = Site.find(params[:id])
  end

  def update_site
    @site = Site.find(params[:id])
    if @site.update_attributes(site_params)
      redirect_to action: :index
    else
      render action: :edit_site
    end
  end

  def edit_site_details
    @site = Site.find(params[:id])
  end

  def update_site_details
    @site = Site.find(params[:id])
    if @site.update_attributes(site_details_params)
      redirect_to action: :index
    else
      render action: :edit_site_details
    end
  end

  def get_themes
    begin
      template = HtmlTemplate.find(params[:template_id])
      @themes = template.themes.order(:name)
      render partial: 'get_themes'
    rescue ActiveRecord::RecordNotFound
      render text: 'invalid'
    rescue ActiveRecord::StatementInvalid
      render text: 'invalid'
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :domain)
  end

  def site_details_params
    params.require(:site).permit(:site_status_id, :html_template_id, :theme_id)
  end

end
