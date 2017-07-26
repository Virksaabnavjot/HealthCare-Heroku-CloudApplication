require 'test_helper'

class TransControllerTest < ActionController::TestCase
  setup do
    @tran = trans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tran" do
    assert_difference('Tran.count') do
      post :create, tran: { age: @tran.age, cost: @tran.cost, description: @tran.description, firm: @tran.firm, firstname: @tran.firstname, lastname: @tran.lastname }
    end

    assert_redirected_to tran_path(assigns(:tran))
  end

  test "should show tran" do
    get :show, id: @tran
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tran
    assert_response :success
  end

  test "should update tran" do
    patch :update, id: @tran, tran: { age: @tran.age, cost: @tran.cost, description: @tran.description, firm: @tran.firm, firstname: @tran.firstname, lastname: @tran.lastname }
    assert_redirected_to tran_path(assigns(:tran))
  end

  test "should destroy tran" do
    assert_difference('Tran.count', -1) do
      delete :destroy, id: @tran
    end

    assert_redirected_to trans_path
  end
end
