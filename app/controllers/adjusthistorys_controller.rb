class AdjusthistorysController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @adjusthistorys = Adjusthistory.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
  end
  
  # have to have these function for the index page works properly
  def sort_column
    Adjusthistory.column_names.include?(params[:sort]) ? params[:sort] : "item_id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
