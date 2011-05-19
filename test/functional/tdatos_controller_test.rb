require 'test_helper'

class TdatosControllerTest < ActionController::TestCase
  setup do
    @tdato = tdatos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tdatos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tdato" do
    assert_difference('Tdato.count') do
      post :create, :tdato => @tdato.attributes
    end

    assert_redirected_to tdato_path(assigns(:tdato))
  end

  test "should show tdato" do
    get :show, :id => @tdato.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tdato.to_param
    assert_response :success
  end

  test "should update tdato" do
    put :update, :id => @tdato.to_param, :tdato => @tdato.attributes
    assert_redirected_to tdato_path(assigns(:tdato))
  end

  test "should destroy tdato" do
    assert_difference('Tdato.count', -1) do
      delete :destroy, :id => @tdato.to_param
    end

    assert_redirected_to tdatos_path
  end
end
