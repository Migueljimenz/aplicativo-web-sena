class Programas::CursosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_programa
  
  def index
    @cursos = @programa.curso
  end

  def show
    @curso = @programa.curso.find(params[:id])
  end

  def new
    @curso = @programa.curso.new
  end

  def create
    @curso = @programa.curso.new(curso_params)
    if @curso.save
      flash[:notice] = "Ficha registrada correctamente"
      redirect_to programa_cursos_url
    else 
      flash[:alert] = "Error al registrar la ficha"
      render :new
    end
  end

  def edit
    @curso = @programa.curso.find(params[:id])
  end

  def update
    @curso = @programa.curso.find(params[:id])
    if @curso.update(update_curso_params)
        redirect_to programa_cursos_url
    else
      render :edit
    end
  end

  def destroy
    @curso = @programa.curso.find(params[:id])
    if @curso.destroy
      flash[:alert] = "Codigo de ficha eliminado correctamente"
    redirect_to programa_cursos_url
    else
      flash[:alert] = "Error al eliminar al eliminar el numero de ficha"
    end
  end

  private

  def set_programa
    @programa = Programa.find(params[:programa_id])
  end

  def update_curso_params
    params.require(:curso).permit(:ficha)
  end

  def curso_params
    params.require(:curso).permit(:ficha)
  end
end
