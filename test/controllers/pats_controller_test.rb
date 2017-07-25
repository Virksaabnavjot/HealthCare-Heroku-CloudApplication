require 'test_helper'

class PatsControllerTest < ActionController::TestCase
  setup do
    @pat = pats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pat" do
    assert_difference('Pat.count') do
      post :create, pat: { appointment: @pat.appointment, condition: @pat.condition, dob: @pat.dob, name: @pat.name, phone: @pat.phone }
    end

    assert_redirected_to pat_path(assigns(:pat))
  end

  test "should show pat" do
    get :show, id: @pat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pat
    assert_response :success
  end

  test "should update pat" do
    patch :update, id: @pat, pat: { appointment: @pat.appointment, condition: @pat.condition, dob: @pat.dob, name: @pat.name, phone: @pat.phone }
    assert_redirected_to pat_path(assigns(:pat))
  end

  test "should destroy pat" do
    assert_difference('Pat.count', -1) do
      delete :destroy, id: @pat
    end

    assert_redirected_to pats_path
  end
end
