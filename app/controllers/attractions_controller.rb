class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      flash[:notice] = "Attraction was successfully created."
      redirect_to attraction_path(@attraction)
    else
      flash[:notice] = "Attraction could not be created."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    flash[:notice] = "Attraction was successfully updated."
    redirect_to attraction_path(@attraction)
  end

  def destroy
    @attraction.destroy
    flash[:notice] = "Attraction was successfully destroyed."
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

end