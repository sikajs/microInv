class AdjusthistorysController < ApplicationController

  def index
    @adjusthistorys = Adjusthistory.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
  end
end
