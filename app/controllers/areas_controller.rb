class AreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_area, only: [:show, :edit, :destroy]
  def index
    @areas = Area.all
    
  end

  def show
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    if @area.save 
      flash[:notice] = "Area creada correctamente"
      redirect_to areas_path
    else
      render :new
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params_update)
      redirect_to areas_path
    else
      render :edit
    end
  end

  def destroy
    @area = Area.find(params[:id])
    if @area.destroy
      flash[:alert] = "Area eliminada correctamente"
      redirect_to areas_path
    end
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end

  def area_params_update
    params.require(:area).permit(:nombreArea, :avatar)
  end

  def area_params
    params.require(:area).permit(:nombreArea, :avatar)
  end
end
