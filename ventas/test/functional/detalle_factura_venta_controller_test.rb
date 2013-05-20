require 'test_helper'

class DetalleFacturaVentaControllerTest < ActionController::TestCase
  setup do
    @detalle_factura_ventum = detalle_factura_venta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_factura_venta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_factura_ventum" do
    assert_difference('DetalleFacturaVentum.count') do
      post :create, detalle_factura_ventum: @detalle_factura_ventum.attributes
    end

    assert_redirected_to detalle_factura_ventum_path(assigns(:detalle_factura_ventum))
  end

  test "should show detalle_factura_ventum" do
    get :show, id: @detalle_factura_ventum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_factura_ventum
    assert_response :success
  end

  test "should update detalle_factura_ventum" do
    put :update, id: @detalle_factura_ventum, detalle_factura_ventum: @detalle_factura_ventum.attributes
    assert_redirected_to detalle_factura_ventum_path(assigns(:detalle_factura_ventum))
  end

  test "should destroy detalle_factura_ventum" do
    assert_difference('DetalleFacturaVentum.count', -1) do
      delete :destroy, id: @detalle_factura_ventum
    end

    assert_redirected_to detalle_factura_venta_path
  end
end
