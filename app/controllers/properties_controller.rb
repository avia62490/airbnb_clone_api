class PropertiesController < ApplicationController

  def index
    properties = Property.all
    render json: properties.as_json
  end

  def create
    property = Property.new(
      title: params[:title],
      address: params[:address],
      description: params[:description],
      price_rate: params[:price_rate],
      max_guests: params[:max_guests],
      bedrooms: params[:bedrooms],
      bathrooms: params[:bathrooms]
    )
    property.save
    render json: property.as_json
  end

  def show
    property = Property.find(params[:id])
    render json: property.as_json
  end

end
