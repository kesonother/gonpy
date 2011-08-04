require 'test_helper'

class ProaccountsControllerTest < ActionController::TestCase
  setup do
    @proaccount = proaccounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proaccounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proaccount" do
    assert_difference('Proaccount.count') do
      post :create, :proaccount => @proaccount.attributes
    end

    assert_redirected_to proaccount_path(assigns(:proaccount))
  end

  test "should show proaccount" do
    get :show, :id => @proaccount.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @proaccount.to_param
    assert_response :success
  end

  test "should update proaccount" do
    put :update, :id => @proaccount.to_param, :proaccount => @proaccount.attributes
    assert_redirected_to proaccount_path(assigns(:proaccount))
  end

  test "should destroy proaccount" do
    assert_difference('Proaccount.count', -1) do
      delete :destroy, :id => @proaccount.to_param
    end

    assert_redirected_to proaccounts_path
  end
end
