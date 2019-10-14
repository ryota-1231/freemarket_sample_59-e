class CategoryController < ApplicationController
  before_action :header_category

  def index
    @categories = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @children = @category.children
  end

  def header_category
    @parents= Category.roots
    @search= Item.ransack(params[:q])
  end

end
