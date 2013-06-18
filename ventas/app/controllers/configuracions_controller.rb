class ConfiguracionsController < ApplicationController
    before_filter :require_login
  # GET /configuracions
  # GET /configuracions.json
  def index
    @configuracions = Configuracion.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @configuracions }
    end
  end

  # GET /configuracions/1
  # GET /configuracions/1.json
  def show
    @configuracion = Configuracion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @configuracion }
    end
  end

  # GET /configuracions/new
  # GET /configuracions/new.json
  def new
    @configuracion = Configuracion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @configuracion }
    end
  end

  # GET /configuracions/1/edit
  def edit
    @configuracion = Configuracion.find(params[:id] )

  end

  # POST /configuracions
  # POST /configuracions.json
  def create
    @configuracion = Configuracion.new(params[:configuracion]) 

    respond_to do |format|
      if @configuracion.save
        format.json { render json: @configuracion, status: :created, location: @configuracion }
        format.js   {}
      else
        format.html { render action: "new" }
        format.json { render json: @configuracion.errors, status: :unprocessable_entity }
      end
    end
end

  # PUT /configuracions/1
  # PUT /configuracions/1.json
  def update
    @configuracion = Configuracion.find(params[:id])
    
    respond_to do |format|
      if @configuracion.update_attributes(params[:configuracion])
        format.html { redirect_to @configuracion}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuracions/1
  # DELETE /configuracions/1.json
  def destroy
    @configuracion = Configuracion.find(params[:id])
    @configuracion.destroy

    respond_to do |format|
      format.html { redirect_to configuracions_url }
      format.json { head :no_content }
    end
  end


end
