class HomeController < ApplicationController

  def index
    if current_user
      redirect_to offices_path
    end 
  end
end