class DepartamentosController < ApplicationController
    before_filter :require_login
  # GET /departamentos
  # GET /departamentos.json
  def index
       @departamentos = Departamento.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departamentos }
    end
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
    @departamento = Departamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departamento }
    end
  end

  # GET /departamentos/new
  # GET /departamentos/new.json
  def new
    @departamento = Departamento.new
    @localidades=Localidad.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departamento }
    end
  end

  # GET /departamentos/1/edit
  def edit
    @departamento = Departamento.find(params[:id])
     @localidades=Localidad.all
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @departamento = Departamento.new(params[:departamento])
    @localidades=Localidad.all
    respond_to do |format|
      if @departamento.save
        flash.now[:alert]= "El departamento se ha guardado correctamente"
        format.html { redirect_to @departamento, notice: 'El departamento se ha guardado correctamente' }
        format.json { render json: @departamento, status: :created, location: @departamento }
          format.js   {}
      else
        format.html { render action: "new" }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departamentos/1
  # PUT /departamentos/1.json
  def update
    @departamento = Departamento.find(params[:id])

    respond_to do |format|
      if @departamento.update_attributes(params[:departamento])
         flash.now[:alert]= "El departamento se ha actualizado correctamente"
        format.html { redirect_to @departamento, notice: 'El departamento se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento = Departamento.find(params[:id])
    @departamento.destroy

    respond_to do |format|
      format.html { redirect_to departamentos_url }
      format.json { head :no_content }
    end
  end
end
