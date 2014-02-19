class MenuController < ApplicationController

  before_filter :site

  def index
    @menus = @site.menus.order(:sequence_order)
  end

  def new_menu
    @menu = @site.menus.new
  end

  def create_menu
    @menu = @site.menus.new(menu_params.merge(sequence_order: @site.menus.maximum(:sequence_order).to_i + 1, active: false))
    if @menu.save
      redirect_to action: :index
    else
      render action: :new_menu
    end
  end

  def edit_menu

  end

  def change_menu_status
    menu = @site.menus.find(params[:id])
    menu.active = params[:status].eql?('active') ? true : false
    menu.save!
    render json: { status: 'success' }
  end

  def change_menu_order
    Menu.reorder_menu( @site, params[:new_menu_order] )
    render json: { status: 'success' }
  end

  private

  def menu_params
    params.require(:menu).permit(:name)
  end

end
