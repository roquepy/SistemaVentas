require 'test_helper'

class DetallesFacturaVentaControllerTest < ActionController::TestCase
  setup do
    @detalles_factura_ventum = detalles_factura_venta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalles_factura_venta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalles_factura_ventum" do
    assert_difference('DetallesFacturaVentum.count') do
      post :create, detalles_factura_ventum: @detalles_factura_ventum.attributes
    end

    assert_redirected_to detalles_factura_ventum_path(assigns(:detalles_factura_ventum))
  end

  test "should show detalles_factura_ventum" do
    get :show, id: @detalles_factura_ventum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalles_factura_ventum
    assert_response :success
  end

  test "should update detalles_factura_ventum" do
    put :update, id: @detalles_factura_ventum, detalles_factura_ventum: @detalles_factura_ventum.attributes
    assert_redirected_to detalles_factura_ventum_path(assigns(:detalles_factura_ventum))
  end

  test "should destroy detalles_factura_ventum" do
    assert_difference('DetallesFacturaVentum.count', -1) do
      delete :destroy, id: @detalles_factura_ventum
    end

    assert_redirected_to detalles_factura_venta_path
  end
end
