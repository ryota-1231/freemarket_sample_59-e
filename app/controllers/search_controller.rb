class SearchController < ApplicationController
  before_action :header_category

  def index
    @brand = Brand.find(params[:brand_id])
    @children = @brand.children
  end

  def header_category
    @parents= Category.roots
  end
end
