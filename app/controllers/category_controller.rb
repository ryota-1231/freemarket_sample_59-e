class CategoryController < ApplicationController
  def index
    @categories = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @children = @category.children
  end
end
