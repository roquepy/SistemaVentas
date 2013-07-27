require 'test_helper'

class MovimientosStocksControllerTest < ActionController::TestCase
  setup do
    @movimiento_stock = movimientos_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimientos_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimiento_stock" do
    assert_difference('MovimientoStock.count') do
      post :create, movimiento_stock: @movimiento_stock.attributes
    end

    assert_redirected_to movimiento_stock_path(assigns(:movimiento_stock))
  end

  test "should show movimiento_stock" do
    get :show, id: @movimiento_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimiento_stock
    assert_response :success
  end

  test "should update movimiento_stock" do
    put :update, id: @movimiento_stock, movimiento_stock: @movimiento_stock.attributes
    assert_redirected_to movimiento_stock_path(assigns(:movimiento_stock))
  end

  test "should destroy movimiento_stock" do
    assert_difference('MovimientoStock.count', -1) do
      delete :destroy, id: @movimiento_stock
    end

    assert_redirected_to movimientos_stocks_path
  end
end
