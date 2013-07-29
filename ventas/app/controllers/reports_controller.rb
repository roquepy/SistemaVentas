require "google_visualr"
class ReportsController < ApplicationController
  before_filter :require_login

  def index
    @facturas = FacturaVentum.all
    data_table = generate_data_table "dia", "2013-07-29", "2013-08-01"
    @chart = generate_graphic data_table, "", "Ventas por dia"
    @table = generate_table data_table

    
    if @table.data_table and @chart.data_table
      respond_to do |format|
        format.html 
        format.js
      end
    else
      respond_to do |format|
        format.html
        format.js { render 'change_report_with_error' }
      end
    end
  end

  private

    def generate_hash range, limit, lower_limit, upper_limit
      hash = Hash.new
      facturas = FacturaVentum.order("monto_total ASC").all
      facturas.each do |factura|
          if factura.fecha.between?(lower_limit,upper_limit)
            key = obtain_key factura, range, limit
            if hash.has_key?(key)
              hash[key]= hash[key]+factura.monto_total
            else
              hash[key]= factura.monto_total
            end 
          end 
        end
      hash
    end

    def consult_between
    @from = params[:from]
    @to = params[:to]
    @type = params[:select_type]
    @range = params[:select_range]
    data_table = generate_data_table(@range, @type, @from, @to)
    @chart = generate_graphic data_table, @type , @range
    @table = generate_table data_table
    respond_to do |format|
      if data_table.rows.size > 0
        format.js { render 'change_report'}
      else
        format.js { render 'change_report_with_error'}
      end
    end
  end

  
    def obtain_key object, range, limit
      key = ""
      if range     == "dia"
        key = object.fecha.to_s.slice(0,limit)
      elsif range  == "ano"
        key = object.fecha.to_s.slice(0,limit)
      else
        key = Date::MONTHNAMES[object.fecha.month]
      end
      key
    end

    def generate_data_table(range, param1="2013-01-01", param2="2013-12-31")
      lower_limit   = Date.parse(param1)
      upper_limit   = Date.parse(param2)
      head_general_report  = [{:type=>"string",:label=> "Fecha"},{:type=>"number",:label=> "Monto (Gs)"}]
      hash = generate_hash range, 10, lower_limit, upper_limit

      data_table = GoogleVisualr::DataTable.new
      data_table.cols= head_general_report
      data_table.add_rows hash.to_a
      data_table
    end

    def generate_table table
      opts   = { :width => 400, :showRowNumber => true }
      chart1 = GoogleVisualr::Interactive::Table.new(table, opts)
      return chart1
    end

    def generate_graphic table, name, legend
      opts   = { width: 500, height: 500, title: name, hAxis: {title: legend, titleTextStyle: {color: '#FF0000'}} }
      chart1 = GoogleVisualr::Interactive::ColumnChart.new(table, opts)
      return chart1
    end

end