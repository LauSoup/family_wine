class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @wines = Wine.all
  end

  def dashboard
    @user = current_user
    @wines = Wine.where(user: current_user)
  end

end
