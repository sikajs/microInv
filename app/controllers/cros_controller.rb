class CrosController < ApplicationController
  def new
    @cro = Cro.new
    
  end

  def create
  
  end

  def index
    @cros = Cro.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
  end
  
  def show
    @cro = Cro.find(params[:id])
  end
end
