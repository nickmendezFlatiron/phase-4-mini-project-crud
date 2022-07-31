class SpicesController < ApplicationController
  wrap_parameters format: [] 
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    spice = Spice.all
    render json: spice , status: :ok
  end 

  def create
    spice = Spice.create(spice_params)
    render json: spice , status: :created
  end 

  def show 
    spice = find_spice
    render json: spice 
  end 

  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice , status: :ok
  end 

  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end 
  
  private

  def find_spice
    spice = Spice.find_by(id: params[:id])
  end 

  def spice_params
    params.permit(:image , :description , :notes , :rating ,:title)
  end

  def render_not_found_response
    render json: {error: "Spice not found"} , status: :not_found
  end 
end
