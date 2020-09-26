
require "open-uri"

class WinesController < ApplicationController

  def new
    @wine = Wine.new
    @countries = Wine.countries
  end

  def create
    @countries = Wine.countries
    @wine = Wine.new(wine_params)
    @wine.user = current_user
    if @wine.valid?
      @wine.save
      if @wine.photo.attached? == false
        img = "https://source.unsplash.com/3uJt73tr4hI"
        file = URI.open(img)
        @wine.photo.attach(io: File.open('app/assets/images/glasses.png'), filename: 'glasses.png', content_type: 'image/png')
      end
      flash[:alert] = "Ton vin est créé!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def edit
    @wine = Wine.find(params[:id]) 
    @countries = Wine.countries
  end

  def update
    @countries = Wine.countries
    @wine = Wine.find(params[:id]) 
    if @wine.update(wine_params)
      redirect_to wine_path(@wine)
    else
      render 'edit'
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :description, :user_id, :price_id, :region_id, :country, :photo)
  end

end
