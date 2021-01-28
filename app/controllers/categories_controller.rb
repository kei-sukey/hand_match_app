class CategoriesController < ApplicationController

  def show
    if user_signed_in?
      @items = Item.where(category_id: params[:id]).find(Item.where(category_id: params[:id]).where.not(user_id: current_user.id).pluck(:id).shuffle[0..0])
    else
      @items = Item.where(category_id: params[:id]).find(Item.where(category_id: params[:id]).pluck(:id).shuffle[0..0])
    end
  end

end
