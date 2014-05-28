class RestockhistorysController < ApplicationController

  def index
    @restockhistorys = Restockhistory.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
  end
end
