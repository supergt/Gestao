class Medico < ActiveRecord::Base


	# Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me


	has_many :pedidos
	has_many :receita
	has_many :diagnosticos
	belongs_to :especialidade

	validates_presence_of :login, :senha, :nome, :dataNascimento, :rg, :localizacaoGeo, :cpf, :crm, :telefoneResidencial, :celular, :especialidade_id, :admin
end
