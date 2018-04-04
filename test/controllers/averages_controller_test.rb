require 'test_helper'

class AveragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @average = averages(:one)
  end

  test "should get index" do
    get averages_url
    assert_response :success
  end

  test "should get new" do
    get new_average_url
    assert_response :success
  end

  test "should create average" do
    assert_difference('Average.count') do
      post averages_url, params: { average: { average: @average.average, course_id: @average.course_id, timestamp: @average.timestamp } }
    end

    assert_redirected_to average_url(Average.last)
  end

  test "should show average" do
    get average_url(@average)
    assert_response :success
  end

  test "should get edit" do
    get edit_average_url(@average)
    assert_response :success
  end

  test "should update average" do
    patch average_url(@average), params: { average: { average: @average.average, course_id: @average.course_id, timestamp: @average.timestamp } }
    assert_redirected_to average_url(@average)
  end

  test "should destroy average" do
    assert_difference('Average.count', -1) do
      delete average_url(@average)
    end

    assert_redirected_to averages_url
  end
end
