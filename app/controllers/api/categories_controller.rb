class Api::CategoriesController < ApplicationController
  
  def index
    parent = Category.find(params[:parent_id])
    @children = parent.children
  end

end