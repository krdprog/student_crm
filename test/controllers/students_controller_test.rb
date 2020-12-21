require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test 'should get index' do
    get students_path
    assert_response :success
  end

  test 'should get show' do
    get student_path(@student)
    assert_response :success
  end

  test 'should get new' do
    get new_student_path
    assert_response :success
  end

  test 'should get edit' do
    get edit_student_path(@student)
    assert_response :success
  end
end
