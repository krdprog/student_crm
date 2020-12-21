require "test_helper"

class StudentTest < ActiveSupport::TestCase
  setup do
    @student = students(:one)
  end

  test 'valid?' do
    assert @student.valid?
  end
end
