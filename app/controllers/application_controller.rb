class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :sort_column, :sort_direction	
  def sort_column
    model_name = controller_name.classify.constantize
    model_name.column_names.include?(params[:sort]) ? params[:sort] : model_name.primary_key
  end
    
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
