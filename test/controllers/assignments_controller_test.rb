require 'test_helper'

class AssignmentsControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
    @assignment = assignments(:one)
  end

  test "should get index" do
    get :index, params: { course_id: @course }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { course_id: @course }
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post :create, params: { course_id: @course, assignment: @assignment.attributes }
    end

    assert_redirected_to course_assignment_path(@course, Assignment.last)
  end

  test "should show assignment" do
    get :show, params: { course_id: @course, id: @assignment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { course_id: @course, id: @assignment }
    assert_response :success
  end

  test "should update assignment" do
    put :update, params: { course_id: @course, id: @assignment, assignment: @assignment.attributes }
    assert_redirected_to course_assignment_path(@course, Assignment.last)
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete :destroy, params: { course_id: @course, id: @assignment }
    end

    assert_redirected_to course_assignments_path(@course)
  end
end
