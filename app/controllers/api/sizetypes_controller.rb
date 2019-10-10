require "category.rb"

class Api::SizetypesController < ApplicationController
  
  def index
    if params[:sizetypes]==nil
      categories = Category.take
      category = categories.find(params[:parent_id])
      sizetypes = category.sizetype_id
      sizetype = Sizetype.find(sizetypes)
      @sizetype = sizetype.children
      return @sizetype
    else
      sizetype = Sizetype.find(params[:sizetypes])
      @sizetype = sizetype.children
    end
      

      
  
  end

end