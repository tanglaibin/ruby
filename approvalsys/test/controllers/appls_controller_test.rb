require 'test_helper'

class ApplsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appl = appls(:one)
  end

  test "should get index" do
    get appls_url
    assert_response :success
  end

  test "should get new" do
    get new_appl_url
    assert_response :success
  end

  test "should create appl" do
    assert_difference('Appl.count') do
      post appls_url, params: { appl: { description: @appl.description, state: @appl.state, title: @appl.title, user_id: @appl.user_id } }
    end

    assert_redirected_to appl_url(Appl.last)
  end

  test "should show appl" do
    get appl_url(@appl)
    assert_response :success
  end

  test "should get edit" do
    get edit_appl_url(@appl)
    assert_response :success
  end

  test "should update appl" do
    patch appl_url(@appl), params: { appl: { description: @appl.description, state: @appl.state, title: @appl.title, user_id: @appl.user_id } }
    assert_redirected_to appl_url(@appl)
  end

  test "should destroy appl" do
    assert_difference('Appl.count', -1) do
      delete appl_url(@appl)
    end

    assert_redirected_to appls_url
  end
end
