require 'test_helper'

class FacturaVentaControllerTest < ActionController::TestCase
  setup do
    @factura_ventum = factura_venta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factura_venta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factura_ventum" do
    assert_difference('FacturaVentum.count') do
      post :create, factura_ventum: @factura_ventum.attributes
    end

    assert_redirected_to factura_ventum_path(assigns(:factura_ventum))
  end

  test "should show factura_ventum" do
    get :show, id: @factura_ventum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factura_ventum
    assert_response :success
  end

  test "should update factura_ventum" do
    put :update, id: @factura_ventum, factura_ventum: @factura_ventum.attributes
    assert_redirected_to factura_ventum_path(assigns(:factura_ventum))
  end

  test "should destroy factura_ventum" do
    assert_difference('FacturaVentum.count', -1) do
      delete :destroy, id: @factura_ventum
    end

    assert_redirected_to factura_venta_path
  end
end
