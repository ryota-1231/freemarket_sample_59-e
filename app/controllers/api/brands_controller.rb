class Api::BrandsController < ApplicationController
  
  def index

    @brands = Brand.where("name LIKE ?", "%#{params[:input]}%")
    
  end

end