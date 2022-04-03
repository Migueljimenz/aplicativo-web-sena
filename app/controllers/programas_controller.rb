class ProgramasController < ApplicationController
  before_action :authenticate_user!
  def index
    @programas = Programa.all
  end
end
