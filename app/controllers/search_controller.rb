class SearchController < ApplicationController
  def index
    @results = User.where('name ilike ?', "%#{params[:query]}%")
  end
end
