require 'test_helper'

class DetallesFacturasVentasAuxsControllerTest < ActionController::TestCase
  setup do
    @detalle_factura_venta_aux = detalles_facturas_ventas_auxs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalles_facturas_ventas_auxs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_factura_venta_aux" do
    assert_difference('DetalleFacturaVentaAux.count') do
      post :create, detalle_factura_venta_aux: @detalle_factura_venta_aux.attributes
    end

    assert_redirected_to detalle_factura_venta_aux_path(assigns(:detalle_factura_venta_aux))
  end

  test "should show detalle_factura_venta_aux" do
    get :show, id: @detalle_factura_venta_aux
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_factura_venta_aux
    assert_response :success
  end

  test "should update detalle_factura_venta_aux" do
    put :update, id: @detalle_factura_venta_aux, detalle_factura_venta_aux: @detalle_factura_venta_aux.attributes
    assert_redirected_to detalle_factura_venta_aux_path(assigns(:detalle_factura_venta_aux))
  end

  test "should destroy detalle_factura_venta_aux" do
    assert_difference('DetalleFacturaVentaAux.count', -1) do
      delete :destroy, id: @detalle_factura_venta_aux
    end

    assert_redirected_to detalles_facturas_ventas_auxs_path
  end
end
