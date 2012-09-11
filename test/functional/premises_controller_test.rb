require 'test_helper'

class PremisesControllerTest < ActionController::TestCase
  setup do
    @premise = premises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premise" do
    assert_difference('Premise.count') do
      post :create, premise: { value_id: @premise.value_id, variable_id: @premise.variable_id }
    end

    assert_redirected_to premise_path(assigns(:premise))
  end

  test "should show premise" do
    get :show, id: @premise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @premise
    assert_response :success
  end

  test "should update premise" do
    put :update, id: @premise, premise: { value_id: @premise.value_id, variable_id: @premise.variable_id }
    assert_redirected_to premise_path(assigns(:premise))
  end

  test "should destroy premise" do
    assert_difference('Premise.count', -1) do
      delete :destroy, id: @premise
    end

    assert_redirected_to premises_path
  end
end
