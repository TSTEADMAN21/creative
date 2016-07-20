require 'test_helper'

class EmailinfosControllerTest < ActionController::TestCase
  setup do
    @emailinfo = emailinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emailinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emailinfo" do
    assert_difference('Emailinfo.count') do
      post :create, emailinfo: { email_id: @emailinfo.email_id }
    end

    assert_redirected_to emailinfo_path(assigns(:emailinfo))
  end

  test "should show emailinfo" do
    get :show, id: @emailinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emailinfo
    assert_response :success
  end

  test "should update emailinfo" do
    patch :update, id: @emailinfo, emailinfo: { email_id: @emailinfo.email_id }
    assert_redirected_to emailinfo_path(assigns(:emailinfo))
  end

  test "should destroy emailinfo" do
    assert_difference('Emailinfo.count', -1) do
      delete :destroy, id: @emailinfo
    end

    assert_redirected_to emailinfos_path
  end
end
