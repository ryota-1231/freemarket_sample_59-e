class SearchController < ApplicationController
  before_action :header_category

  def index
    @brand = Brand.find(params[:brand_id])
    @children = @brand.children
  end

  def new
    @category = Category.find(params[:category_id])
    category_ids = @category.has_children? ? @category.descendants.ids : @category.id
    @items = Item.where(category_id: category_ids)
    @children = @category.children
  end

  def header_category
    @parents= Category.roots
    @search= Item.ransack(params[:q])
  end

end
