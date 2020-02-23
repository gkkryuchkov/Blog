require 'test_helper'

class AboutMesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @about_me = about_mes(:one)
  end

  test "should get index" do
    get about_mes_url
    assert_response :success
  end

  test "should get new" do
    get new_about_me_url
    assert_response :success
  end

  test "should create about_me" do
    assert_difference('AboutMe.count') do
      post about_mes_url, params: { about_me: {  } }
    end

    assert_redirected_to about_me_url(AboutMe.last)
  end

  test "should show about_me" do
    get about_me_url(@about_me)
    assert_response :success
  end

  test "should get edit" do
    get edit_about_me_url(@about_me)
    assert_response :success
  end

  test "should update about_me" do
    patch about_me_url(@about_me), params: { about_me: {  } }
    assert_redirected_to about_me_url(@about_me)
  end

  test "should destroy about_me" do
    assert_difference('AboutMe.count', -1) do
      delete about_me_url(@about_me)
    end

    assert_redirected_to about_mes_url
  end
end
