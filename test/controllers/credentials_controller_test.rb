require 'test_helper'

class CredentialsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @credential = credentials(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create credential" do
    assert_difference('Credential.count') do
      post :create, params: { user_id: @user, credential: @credential.attributes }
    end

    assert_redirected_to user_credential_path(@user, Credential.last)
  end

  test "should show credential" do
    get :show, params: { user_id: @user, id: @credential }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @credential }
    assert_response :success
  end

  test "should update credential" do
    put :update, params: { user_id: @user, id: @credential, credential: @credential.attributes }
    assert_redirected_to user_credential_path(@user, Credential.last)
  end

  test "should destroy credential" do
    assert_difference('Credential.count', -1) do
      delete :destroy, params: { user_id: @user, id: @credential }
    end

    assert_redirected_to user_credentials_path(@user)
  end
end
