class FuncionsController < ApplicationController
  # GET /funcions
  # GET /funcions.json
  def index
    @funcions = Funcion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funcions }
    end
  end

  # GET /funcions/1
  # GET /funcions/1.json
  def show
    @funcion = Funcion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @funcion }
    end
  end

  # GET /funcions/new
  # GET /funcions/new.json
  def new
    @funcion = Funcion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @funcion }
    end
  end

  # GET /funcions/1/edit
  def edit
    @funcion = Funcion.find(params[:id])
  end

  # POST /funcions
  # POST /funcions.json
  def create
    @funcion = Funcion.new(params[:funcion])

    respond_to do |format|
      if @funcion.save
        format.html { redirect_to @funcion, notice: 'Funcion was successfully created.' }
        format.json { render json: @funcion, status: :created, location: @funcion }
      else
        format.html { render action: "new" }
        format.json { render json: @funcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /funcions/1
  # PUT /funcions/1.json
  def update
    @funcion = Funcion.find(params[:id])

    respond_to do |format|
      if @funcion.update_attributes(params[:funcion])
        format.html { redirect_to @funcion, notice: 'Funcion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @funcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcions/1
  # DELETE /funcions/1.json
  def destroy
    @funcion = Funcion.find(params[:id])
    @funcion.destroy

    respond_tzo do |format|
      format.html { redirect_to funcions_url }
      format.json { head :no_content }
    end
  end
end
