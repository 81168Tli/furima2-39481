class ItemsController < ApplicationController
  before_action :item_find, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :check_owner, only: [:edit, :update]


  def index
    @items = Item.includes(:user).order(created_at: :desc)
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
  end

  def edit
  end

  def update
    if
    @item.update(item_params)
    redirect_to item_path(params[:id])

    else
    render :edit, status: :unprocessable_entity
    end
  end


        

  
  private
def item_find
  @item = Item.find(params[:id])
end


  def item_params
    params.require(:item).permit(:image, :name, :content, :genre_id, :state_id, :deriver_cost_id, :prefecture_id, :deriver_day_id, :price).merge(user_id: current_user.id)
  end

  def check_owner
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end


end
