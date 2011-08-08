require 'test_helper'

class ProaccountsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit_name" do
    get :edit_name
    assert_response :success
  end

  test "should get edit_services" do
    get :edit_services
    assert_response :success
  end

  test "should get edit_photo" do
    get :edit_photo
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

end
