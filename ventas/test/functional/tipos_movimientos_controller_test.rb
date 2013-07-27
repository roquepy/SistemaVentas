require 'test_helper'

class TiposMovimientosControllerTest < ActionController::TestCase
  setup do
    @tipo_movimiento = tipos_movimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_movimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_movimiento" do
    assert_difference('TipoMovimiento.count') do
      post :create, tipo_movimiento: @tipo_movimiento.attributes
    end

    assert_redirected_to tipo_movimiento_path(assigns(:tipo_movimiento))
  end

  test "should show tipo_movimiento" do
    get :show, id: @tipo_movimiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_movimiento
    assert_response :success
  end

  test "should update tipo_movimiento" do
    put :update, id: @tipo_movimiento, tipo_movimiento: @tipo_movimiento.attributes
    assert_redirected_to tipo_movimiento_path(assigns(:tipo_movimiento))
  end

  test "should destroy tipo_movimiento" do
    assert_difference('TipoMovimiento.count', -1) do
      delete :destroy, id: @tipo_movimiento
    end

    assert_redirected_to tipos_movimientos_path
  end
end
