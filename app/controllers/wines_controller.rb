class WinesController < ApplicationController

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.save

    redirect_to root_path
  end

  private

  def wine_params
    params_require(:wine).permit(:name, :description, :user_id, :price_id, :region_id, :country)
  end

end
