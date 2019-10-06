require "category.rb"

class Api::SizetypesController < ApplicationController
  
  def index
    categories = Category.take
    category = categories.find(params[:parent_id])
    sizetypes = category.sizetype_id
    sizetype = Sizetype.find(sizetypes)
    
      @sizetype = sizetype.children

      return @sizetype
  
  end

end