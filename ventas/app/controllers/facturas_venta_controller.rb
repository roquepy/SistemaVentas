class FacturasVentaController < ApplicationController
  # GET /facturas_venta
  # GET /facturas_venta.json
  def index
    @facturas_ventas = FacturasVenta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facturas_ventas }
    end
  end

  # GET /facturas_venta/1
  # GET /facturas_venta/1.json
  def show
    @facturas_venta = FacturasVenta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @facturas_venta}
    end
  end

  # GET /facturas_venta/new
  # GET /facturas_venta/new.json
  def new
    @facturas_venta= FacturasVenta.new
    @clientes= Cliente.all
    @condiciones_de_pagos= CondicionDePago.all
    @tipos_de_valores= TipoValorPago.all 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facturas_venta }
    end
  end

  # GET /facturas_venta/1/edit
  def edit
    @facturas_venta = FacturasVenta.find(params[:id])
    @clientes= Cliente.all
    @condiciones_de_pagos= CondicionDePago.all
    @tipos_de_valores= TipoValorPago.all 
  end

  # POST /facturas_venta
  # POST /facturas_venta.json
  def create
    @facturas_venta = FacturasVenta.new(params[:facturas_venta])
    @clientes= Cliente.all
    @condiciones_de_pagos= CondicionDePago.all
    @tipos_de_valores= TipoValorPago.all 
    respond_to do |format|
      if @facturas_venta.save
        format.html { redirect_to @facturas_venta, notice: 'La factura venta se ha creado correctamente.' }
        format.json { render json: @facturas_venta, status: :created, location: @facturas_venta }
      else
        format.html { render action: "new" }
        format.json { render json: @facturas_venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facturas_venta/1
  # PUT /facturas_venta/1.json
  def update
    @facturas_venta = FacturasVenta.find(params[:id])

    respond_to do |format|
      if @facturas_venta.update_attributes(params[:facturas_venta])
        format.html { redirect_to @facturas_venta, notice: 'Se ha actualizado correctamente la factura venta' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facturas_venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facturas_venta/1
  # DELETE /facturas_venta/1.json
  def destroy
    @facturas_venta= FacturasVenta.find(params[:id])
    @facturas_venta.destroy

    respond_to do |format|
      format.html { redirect_to facturas_venta_url }
      format.json { head :no_content }
    end
  end
end
