require 'test_helper'

class BmxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bmx = bmxes(:one)
  end

  test "should get index" do
    get bmxes_url
    assert_response :success
  end

  test "should get new" do
    get new_bmx_url
    assert_response :success
  end

  test "should create bmx" do
    assert_difference('Bmx.count') do
      post bmxes_url, params: { bmx: { string: @bmx.string } }
    end

    assert_redirected_to bmx_url(Bmx.last)
  end

  test "should show bmx" do
    get bmx_url(@bmx)
    assert_response :success
  end

  test "should get edit" do
    get edit_bmx_url(@bmx)
    assert_response :success
  end

  test "should update bmx" do
    patch bmx_url(@bmx), params: { bmx: { string: @bmx.string } }
    assert_redirected_to bmx_url(@bmx)
  end

  test "should destroy bmx" do
    assert_difference('Bmx.count', -1) do
      delete bmx_url(@bmx)
    end

    assert_redirected_to bmxes_url
  end
end
