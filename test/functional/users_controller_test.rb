require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @request.env["HTTP_AUTHORIZATION"]="Basic "+Base64::encode64("#{users(:one).email}:#{users(:one).password}")
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
     @user.email = 'e@mail.com'
    assert_difference('User.count') do
      post :create, :user => @user.attributes
    end
    assert_equal false,@user.is_reg_finished
    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => @user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user.to_param
    assert_response :success
  end

  test "should update user" do
 
    put :update, :id => @user.to_param, :user => {:is_reg_finished=>true}
    @user.reload 
    assert_equal true,@user.is_reg_finished
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user.to_param
    end

    assert_redirected_to users_path
  end
end
