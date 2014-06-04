require 'test_helper'

class AccountRepsControllerTest < ActionController::TestCase
  setup do
    @account_rep = account_reps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_reps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_rep" do
    assert_difference('AccountRep.count') do
      post :create, account_rep: { account_id: @account_rep.account_id, rep_level: @account_rep.rep_level, user_id: @account_rep.user_id }
    end

    assert_redirected_to account_rep_path(assigns(:account_rep))
  end

  test "should show account_rep" do
    get :show, id: @account_rep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_rep
    assert_response :success
  end

  test "should update account_rep" do
    put :update, id: @account_rep, account_rep: { account_id: @account_rep.account_id, rep_level: @account_rep.rep_level, user_id: @account_rep.user_id }
    assert_redirected_to account_rep_path(assigns(:account_rep))
  end

  test "should destroy account_rep" do
    assert_difference('AccountRep.count', -1) do
      delete :destroy, id: @account_rep
    end

    assert_redirected_to account_reps_path
  end
end
