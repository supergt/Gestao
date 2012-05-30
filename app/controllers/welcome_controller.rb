class WelcomeController < ApplicationController
  

  def index

  	num_per_page = 10

  	if params[:search] != nil

  		@categoria = Categoria.find(params[:categoria].values).first

  		if @categoria.nome == 'Nome'
  			@prontuarios = Prontuario.where('nome LIKE ?', "%"+params[:search]+"%").paginate(:per_page => num_per_page, :page => params[:prontuarios_page])
  		elsif @categoria.nome == 'Gênero'
  			@prontuarios = Prontuario.where('generos.nome LIKE ?', "%"+params[:search]+"%").joins(:genero).paginate(:per_page => num_per_page, :page => params[:prontuarios_page])
  		end
  	else
  		@prontuarios = Prontuario.paginate(:per_page => num_per_page, :page => params[:prontuarios_page])
  	end
  end

  def exames

  	num_per_page = 10
		
		@exames = Exame.paginate(:per_page => num_per_page, :page => params[:exames_page])

  end


end
