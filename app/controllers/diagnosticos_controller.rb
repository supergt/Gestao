class DiagnosticosController < ApplicationController
  # GET /diagnosticos
  # GET /diagnosticos.json
  def index
    @diagnosticos = Diagnostico.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @diagnosticos }
    end
  end

  # GET /diagnosticos/1
  # GET /diagnosticos/1.json
  def show
    @diagnostico = Diagnostico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @diagnostico }
    end
  end

  # GET /diagnosticos/new
  # GET /diagnosticos/new.json
  def new
    @prontuario = Prontuario.find(params[:prontuario])
    @diagnostico = Diagnostico.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @diagnostico }
    end
  end

  # GET /diagnosticos/1/edit
  def edit
    @diagnostico = Diagnostico.find(params[:id])
  end

  # POST /diagnosticos
  # POST /diagnosticos.json
  def create
    @prontuario = Prontuario.find(params[:prontuario].values).first
    @diagnostico = @prontuario.diagnosticos.build(params[:diagnostico])
    @diagnostico.medico = current_medico

    respond_to do |format|
      if @diagnostico.save
        format.html { redirect_to @prontuario}
        format.json { render :json => @diagnostico, :status => :created, :location => @diagnostico }
      else
        format.html { render :action => "new" }
        format.json { render :json => @diagnostico.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /diagnosticos/1
  # PUT /diagnosticos/1.json
  def update
    @diagnostico = Diagnostico.find(params[:id])

    respond_to do |format|
      if @diagnostico.update_attributes(params[:diagnostico])
        format.html { redirect_to @diagnostico, :notice => 'Diagnostico was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @diagnostico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnosticos/1
  # DELETE /diagnosticos/1.json
  def destroy
    @diagnostico = Diagnostico.find(params[:id])
    @diagnostico.destroy

    respond_to do |format|
      format.html { redirect_to diagnosticos_url }
      format.json { head :no_content }
    end
  end
end
