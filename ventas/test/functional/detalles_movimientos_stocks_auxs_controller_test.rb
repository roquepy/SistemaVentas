require 'test_helper'

class DetallesMovimientosStocksAuxsControllerTest < ActionController::TestCase
  setup do
    @detalle_movimiento_stock_aux = detalles_movimientos_stocks_auxs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalles_movimientos_stocks_auxs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_movimiento_stock_aux" do
    assert_difference('DetalleMovimientoStockAux.count') do
      post :create, detalle_movimiento_stock_aux: @detalle_movimiento_stock_aux.attributes
    end

    assert_redirected_to detalle_movimiento_stock_aux_path(assigns(:detalle_movimiento_stock_aux))
  end

  test "should show detalle_movimiento_stock_aux" do
    get :show, id: @detalle_movimiento_stock_aux
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_movimiento_stock_aux
    assert_response :success
  end

  test "should update detalle_movimiento_stock_aux" do
    put :update, id: @detalle_movimiento_stock_aux, detalle_movimiento_stock_aux: @detalle_movimiento_stock_aux.attributes
    assert_redirected_to detalle_movimiento_stock_aux_path(assigns(:detalle_movimiento_stock_aux))
  end

  test "should destroy detalle_movimiento_stock_aux" do
    assert_difference('DetalleMovimientoStockAux.count', -1) do
      delete :destroy, id: @detalle_movimiento_stock_aux
    end

    assert_redirected_to detalles_movimientos_stocks_auxs_path
  end
end
