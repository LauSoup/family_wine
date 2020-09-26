class WinesController < ApplicationController

  def new
    @wine = Wine.new
    @countries = Wine.countries
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.user = current_user
    if @wine.valid?
      @wine.save
      flash[:alert] = "Ton vin est créé!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :description, :user_id, :price_id, :region_id, :country, :photo)
  end

end
