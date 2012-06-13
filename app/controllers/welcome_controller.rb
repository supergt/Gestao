class WelcomeController < ApplicationController  

  def index

    num_per_page = 10

    if params[:search] != nil

      @categoria = Categoria.find(params[:categoria].values).first

      if @categoria.id == 1
        @prontuarios = Prontuario.where('nome LIKE ?', "%"+params[:search]+"%").paginate(:per_page => num_per_page, :page => params[:prontuarios_page])
      elsif @categoria.id == 4 then
        @prontuarios = Prontuario.where('generos.nome LIKE ?', "%"+params[:search]+"%").joins(:genero).paginate(:per_page => num_per_page, :page => params[:prontuarios_page])
      end
    else
      @prontuarios = Prontuario.paginate(:per_page => num_per_page, :page => params[:prontuarios_page])
    end
  end

  def inicio
	if current_medico != nil
		@texto = "Bem Vindo, " + current_medico.nome
	else
		@texto = "Por favor, faça login"
	end
  end

  def exames
    num_per_page = 10

    if params[:search] != nil
      @exames = Exame.where('nome LIKE ?', "%"+params[:search]+"%").paginate(:per_page => num_per_page, :page => params[:exames_page])
    else
      @exames = Exame.paginate(:per_page => num_per_page, :page => params[:exames_page])
    end
  end

  def examesProntos

    num_per_page = 10

    @exames = Exame.where(:status => 'ok').paginate(:per_page => num_per_page, :page => params[:exames_page])

  end
end
