class HomeController < ApplicationController
  def index
    render json: { data: 'sucessssss' }
  end
end