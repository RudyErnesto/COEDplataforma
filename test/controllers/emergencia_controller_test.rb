require 'test_helper'

class EmergenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emergencium = emergencia(:one)
  end

  test "should get index" do
    get emergencia_url
    assert_response :success
  end

  test "should get new" do
    get new_emergencium_url
    assert_response :success
  end

  test "should create emergencium" do
    assert_difference('Emergencium.count') do
      post emergencia_url, params: { emergencium: { address: @emergencium.address, descrption: @emergencium.descrption, latitude: @emergencium.latitude, longitude: @emergencium.longitude, title: @emergencium.title } }
    end

    assert_redirected_to emergencium_url(Emergencium.last)
  end

  test "should show emergencium" do
    get emergencium_url(@emergencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_emergencium_url(@emergencium)
    assert_response :success
  end

  test "should update emergencium" do
    patch emergencium_url(@emergencium), params: { emergencium: { address: @emergencium.address, descrption: @emergencium.descrption, latitude: @emergencium.latitude, longitude: @emergencium.longitude, title: @emergencium.title } }
    assert_redirected_to emergencium_url(@emergencium)
  end

  test "should destroy emergencium" do
    assert_difference('Emergencium.count', -1) do
      delete emergencium_url(@emergencium)
    end

    assert_redirected_to emergencia_url
  end
end
