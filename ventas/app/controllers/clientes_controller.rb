class ClientesController < ApplicationController
  # GET /clientes
  # GET /clientes.json
  def index

    @clientes = Cliente.paginate(:page => params[:page], :per_page => 10)
    @clientes_nombres=Cliente.find(:all,:conditions=>['like nombre ?',"%#{params[:search]}%"])
    respond_to do |format|

      format.html # index.html.erb
      format.json { render json: @clientes }
    end
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    @cliente = Cliente.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cliente }
    end
  end 

  # GET /clientes/new
  # GET /clientes/new.json
  def new
    @cliente = Cliente.new
    localidad_new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cliente }
    end
  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
    localidad_new
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(params[:cliente])
    localidad_new

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'El Cliente se ha guardado correctamente.' }
        format.json { render json: @cliente, status: :created, location: @cliente }
        format.js   {}
      else
        format.html { render action: "new" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes/1
  # PUT /clientes/1.json
  def update
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to clientes_url }
      format.json { head :no_content }
    end
  end
  def localidad_new
      @localidad= Localidad.new
      @departamentos=Departamento.all
     
  end
  def funcionario_create
      @localidad = Localidad.new(params[:funcionario])
       @departamentos=Departamento.all
      if @localidad.save
        flash[:notice] = "Se ha guardado la localidad"
      else
        flash[:notice] = "Hubo Problemas, no guardo"
      end
  end
end
