require "test_helper"

class StudentTest < ActiveSupport::TestCase
  setup do
    @student = students(:one)
  end

  test 'valid?' do
    assert @student.valid?
  end

  test 'invalid without first_name' do
    @student.update(first_name: nil)

    assert @student.invalid?
  end

  test 'invalid without last_name' do
    @student.update(last_name: nil)

    assert @student.invalid?
  end

  test 'invalid without gender' do
    @student.update(gender: nil)

    assert @student.invalid?
  end

  test 'invalid if first_name is too long' do
    @student.update(first_name: 'A' * 41)

    assert @student.invalid?
  end

  test 'invalid if middle_name is too long' do
    @student.update(middle_name: 'A' * 61)

    assert @student.invalid?
  end

  test 'invalid if last_name is too long' do
    @student.update(last_name: 'A' * 41)

    assert @student.invalid?
  end

  test 'invalid if signal is too long' do
    @student.update(signal: 'A' * 17)

    assert @student.invalid?
  end

  test 'invalid if signal is too short' do
    @student.update(signal: 'A' * 5)

    assert @student.invalid?
  end

  test 'invalid if signal is not uniq' do
    Student.create(
      first_name: 'String',
      middle_name: 'String',
      last_name: 'String',
      gender: 0,
      signal: 'QWERTY'
    )

    @student.update(signal: 'QWERTY')
    assert @student.invalid?
  end
end
