class SearchController < ApplicationController
  before_filter :authenticate_user!

  def tags
    @tags = Tag.where("name ilike ?", "%#{params[:query]}%")
  end
end
