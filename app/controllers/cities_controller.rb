class CitiesController < ApplicationController
  def index
    @cities = City.where(prefecture_id: params[:prefecture_id])
    respond_to do |format|
      format.json { render json: @cities }
    end
  end
end
