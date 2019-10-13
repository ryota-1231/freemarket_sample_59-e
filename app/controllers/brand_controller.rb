class BrandController < ApplicationController
  before_action :header_category

  def index
    @brands = Brand.where(ancestry: nil)
    @brand = Brand.find(1)
  end

  def show
    @brand = Brand.find(params[:id])
    @children = @brand.children
  end

  def header_category
    @parents= Category.roots
  end
end