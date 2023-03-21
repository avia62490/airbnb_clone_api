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

  def update
    property = Property.find(params[:id])
    property.title = params[:title] || property.title
    property.address = params[:address] || property.address
    property.description = params[:description] || property.description
    property.price_rate = params[:price_rate] || property.price_rate
    property.max_guests = params[:max_guests] || property.max_guests
    property.bedrooms = params[:bedrooms] || property.bedrooms
    property.bathrooms = params[:bathrooms] || property.bathrooms
    property.service_fee = params[:service_fee] || property.service_fee
    property.type = params[:type] || property.type
    property.hot_tub = params[:hot_tub] || property.hot_tub
    property.pool = params[:pool] || property.pool
    property.laundry = params[:laundry] || property.laundry
    property.fireplace = params[:fireplace] || property.fireplace
    property.save
    render json: property.as_json
  end

  def destroy
    property = Property.find(params[:id])
    property.destroy
    render json: property.as_json
  end

  def search
    results = Geocoder.search("Paris")
    render json: results.first.coordinates.as_json
  end

end
