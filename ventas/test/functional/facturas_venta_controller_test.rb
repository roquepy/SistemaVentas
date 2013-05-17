require 'test_helper'

class FacturasVentaControllerTest < ActionController::TestCase
  setup do
    @facturas_ventum = facturas_venta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facturas_venta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facturas_ventum" do
    assert_difference('FacturasVentum.count') do
      post :create, facturas_ventum: @facturas_ventum.attributes
    end

    assert_redirected_to facturas_ventum_path(assigns(:facturas_ventum))
  end

  test "should show facturas_ventum" do
    get :show, id: @facturas_ventum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facturas_ventum
    assert_response :success
  end

  test "should update facturas_ventum" do
    put :update, id: @facturas_ventum, facturas_ventum: @facturas_ventum.attributes
    assert_redirected_to facturas_ventum_path(assigns(:facturas_ventum))
  end

  test "should destroy facturas_ventum" do
    assert_difference('FacturasVentum.count', -1) do
      delete :destroy, id: @facturas_ventum
    end

    assert_redirected_to facturas_venta_path
  end
end
