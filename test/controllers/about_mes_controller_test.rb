require 'test_helper'

class AboutMeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @about_mes = about_mess(:one)
  end

  test "should get index" do
    get about_mess_url
    assert_response :success
  end

  test "should get new" do
    get new_about_mes_url
    assert_response :success
  end

  test "should create about_mes" do
    assert_difference('AboutMe.count') do
      post about_mess_url, params: { about_mes: {  } }
    end

    assert_redirected_to about_mes_url(AboutMe.last)
  end

  test "should show about_mes" do
    get about_mes_url(@about_mes)
    assert_response :success
  end

  test "should get edit" do
    get edit_about_mes_url(@about_mes)
    assert_response :success
  end

  test "should update about_mes" do
    patch about_mes_url(@about_mes), params: { about_mes: {  } }
    assert_redirected_to about_mes_url(@about_mes)
  end

  test "should destroy about_mes" do
    assert_difference('AboutMe.count', -1) do
      delete about_mes_url(@about_mes)
    end

    assert_redirected_to about_mess_url
  end
end
