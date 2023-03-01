class HousesController < ApplicationController

  def index
    houses = House.all
    render json: houses.as_json
  end

  def create
    house = House.new(
      title: params[:title],
      address: params[:address],
      description: params[:description],
      price_rate: params[:price_rate],
      max_guests: params[:max_guests],
      bedrooms: params[:bedrooms],
      bathrooms: params[:bathrooms]
    )
    house.save
    render json: house.as_json
  end

end
