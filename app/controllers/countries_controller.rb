class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :update, :destroy, :has_states_cities]

  # GET /countries
  def index
    @countries = Country.all

    render json: @countries
  end

  # GET /countries/1
  def show
    render json: @country
  end

  # POST /countries
  def create
    @country = Country.new(country_params)

    if @country.save
      render json: @country, status: :created, location: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /countries/1
  def update
    if @country.update(country_params)
      render json: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
  end


  def has_states_cities

   #render :json => {:states => @country.states, :cities => @country.cities }
   # render json: @country.to_json(include: [:states, :cities])
  #options = {include: [:states, :cities]}
  #render json: CountrySerializer.new(@country, options)
   #render json: @country
   render json: @country, include: ['states', 'cities']
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:name)
    end
end
