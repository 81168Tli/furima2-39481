class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.includes(:user, :order).order(created_at: :desc)
  end


  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity

    end

  end

  def show
    @item = Item.includes(:order).find(params[:id])
  end

        

    
    
  

  private
  def item_params
    params.require(:item).permit(:image, :name, :content, :genre_id, :state_id, :deriver_cost_id, :prefecture_id, :deriver_day_id, :price).merge(user_id: current_user.id)
  end


end
