class Areas::ProgramasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_area

  def index
    @programas = @area.programas
  end

  def show
    @programa = @area.programas.find(params[:id])
  end

  def new
    @programa = @area.programas.new
  end

  def edit
    @programa = @area.programas.find(params[:id])
  end

  def update
    @programa = @area.programas.find(params[:id])
    if @programa.update(programa_params_update)
      redirect_to area_programas_url
    else
      render :edit
    end
  end

  def destroy
    @programa = @area.programas.find(params[:id])
    if @programa.destroy
      flash[:alert] = "Programa eliminado correctamente"
    redirect_to area_programas_url
    else 
      flash[:alert] = "Error al eliminar el programa"
    end
  end

  def create
    @programa = @area.programas.new(programa_params)
    if @programa.save 
        flash[:notice] = "Programa creado correctamente"
        redirect_to area_programas_url
    else
      render :new
    end
  end

  private

  def set_area
    @area = Area.find(params[:area_id])
  end

  def programa_params
    params.require(:programa).permit(:nombre)
  end

  def programa_params_update
    params.require(:programa).permit(:nombre)
  end
end
