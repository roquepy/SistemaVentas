require 'test_helper'

class DetallesMovimientosStocksControllerTest < ActionController::TestCase
  setup do
    @detalle_movimiento_stock = detalles_movimientos_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalles_movimientos_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_movimiento_stock" do
    assert_difference('DetalleMovimientoStock.count') do
      post :create, detalle_movimiento_stock: @detalle_movimiento_stock.attributes
    end

    assert_redirected_to detalle_movimiento_stock_path(assigns(:detalle_movimiento_stock))
  end

  test "should show detalle_movimiento_stock" do
    get :show, id: @detalle_movimiento_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_movimiento_stock
    assert_response :success
  end

  test "should update detalle_movimiento_stock" do
    put :update, id: @detalle_movimiento_stock, detalle_movimiento_stock: @detalle_movimiento_stock.attributes
    assert_redirected_to detalle_movimiento_stock_path(assigns(:detalle_movimiento_stock))
  end

  test "should destroy detalle_movimiento_stock" do
    assert_difference('DetalleMovimientoStock.count', -1) do
      delete :destroy, id: @detalle_movimiento_stock
    end

    assert_redirected_to detalles_movimientos_stocks_path
  end
end
