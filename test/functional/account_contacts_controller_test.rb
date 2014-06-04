require 'test_helper'

class AccountContactsControllerTest < ActionController::TestCase
  setup do
    @account_contact = account_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_contact" do
    assert_difference('AccountContact.count') do
      post :create, account_contact: { account_id: @account_contact.account_id, customer_type: @account_contact.customer_type, email: @account_contact.email, icq: @account_contact.icq, main_contact: @account_contact.main_contact, msn: @account_contact.msn, name: @account_contact.name, phone: @account_contact.phone, role_id: @account_contact.role_id, skype: @account_contact.skype }
    end

    assert_redirected_to account_contact_path(assigns(:account_contact))
  end

  test "should show account_contact" do
    get :show, id: @account_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_contact
    assert_response :success
  end

  test "should update account_contact" do
    put :update, id: @account_contact, account_contact: { account_id: @account_contact.account_id, customer_type: @account_contact.customer_type, email: @account_contact.email, icq: @account_contact.icq, main_contact: @account_contact.main_contact, msn: @account_contact.msn, name: @account_contact.name, phone: @account_contact.phone, role_id: @account_contact.role_id, skype: @account_contact.skype }
    assert_redirected_to account_contact_path(assigns(:account_contact))
  end

  test "should destroy account_contact" do
    assert_difference('AccountContact.count', -1) do
      delete :destroy, id: @account_contact
    end

    assert_redirected_to account_contacts_path
  end
end
