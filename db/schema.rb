# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120612200503) do

  create_table "categoria", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "diagnosticos", :force => true do |t|
    t.string   "descricao"
    t.datetime "data"
    t.integer  "medico_id"
    t.integer  "prontuario_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "especialidades", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exames", :force => true do |t|
    t.integer  "prontuario_id"
    t.string   "resultado"
    t.string   "nome"
    t.datetime "dataRealizacao"
    t.datetime "dataPronto"
    t.string   "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "generos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medicos", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.date     "dataNascimento"
    t.integer  "rg"
    t.string   "localizacaoGeo"
    t.integer  "cpf"
    t.integer  "crm"
    t.integer  "telefoneResidencial"
    t.integer  "celular"
    t.integer  "especialidade_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "medicos", ["email"], :name => "index_medicos_on_email", :unique => true
  add_index "medicos", ["reset_password_token"], :name => "index_medicos_on_reset_password_token", :unique => true

  create_table "ordems", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pedidos", :force => true do |t|
    t.datetime "data"
    t.integer  "medico_id"
    t.integer  "prontuario_id"
    t.string   "nome"
    t.string   "restricao"
    t.string   "recomendacao"
    t.string   "deveAnalizar"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "prontuarios", :force => true do |t|
    t.string   "nome"
    t.datetime "dataNascimento"
    t.string   "localizacaoGeo"
    t.string   "cadastroSaude"
    t.string   "habitoVida"
    t.integer  "telefoneResidencial"
    t.integer  "celular"
    t.string   "email"
    t.integer  "genero_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "receita", :force => true do |t|
    t.datetime "data"
    t.string   "medicamento"
    t.string   "dosagem"
    t.string   "frequencia"
    t.string   "duracao"
    t.string   "observacao"
    t.integer  "medico_id"
    t.integer  "prontuario_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
