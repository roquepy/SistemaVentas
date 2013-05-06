require 'test_helper'

class FuncionsControllerTest < ActionController::TestCase
  setup do
    @funcion = funcions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcion" do
    assert_difference('Funcion.count') do
      post :create, funcion: @funcion.attributes
    end

    assert_redirected_to funcion_path(assigns(:funcion))
  end

  test "should show funcion" do
    get :show, id: @funcion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcion
    assert_response :success
  end

  test "should update funcion" do
    put :update, id: @funcion, funcion: @funcion.attributes
    assert_redirected_to funcion_path(assigns(:funcion))
  end

  test "should destroy funcion" do
    assert_difference('Funcion.count', -1) do
      delete :destroy, id: @funcion
    end

    assert_redirected_to funcions_path
  end
end
