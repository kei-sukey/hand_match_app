class CategoriesController < ApplicationController

  def show
    @items = Item.where(category_id: params[:id]).find(Item.where(category_id: params[:id]).pluck(:id).shuffle[0..0])
  end

end
