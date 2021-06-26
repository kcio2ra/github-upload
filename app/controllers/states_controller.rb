class StatesController < ApplicationController
  before_action :set_state, only: [:show, :update, :destroy, :has_cities]

  # GET /states
  def index
    @states = State.all

    render json: @states
  end

  # GET /states/1
  def show
    render json: @state
  end

  # POST /states
  def create
    @state = State.new(state_params)

    if @state.save
      render json: @state, status: :created, location: @state
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /states/1
  def update
    if @state.update(state_params)
      render json: @state
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /states/1
  def destroy
    @state.destroy
  end

    # GET states/country/:country_id
  def from_country
   #@state = State.find(params[:country_id])

   @states = State.where(country_id: params[:country_id])

    render json: @states
  end

      # GET states/country/:country_id
  def has_cities
       render json: @state.cities 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def state_params
      params.require(:state).permit(:name, :country_id)
    end
end
