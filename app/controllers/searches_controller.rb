class SearchesController < ApplicationController
  before_action :header_category

  def index  
    @items = Item.search(params[:search]).limit(132)
    @search = params[:search]
    @parents= Category.roots
  end

end
