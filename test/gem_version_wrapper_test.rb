require "test_helper"

class GemVersionWrapperTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::GemVersionWrapper::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_input_is_string_1
    actual_value   = GemVersionWrapper.build('1.0')
    expected_value = Gem::Version.new('1.0')
    assert_equal expected_value, actual_value
  end

  def test_input_is_string_2
    actual_value   = GemVersionWrapper.build('1')
    expected_value = Gem::Version.new('1')
    assert_equal expected_value, actual_value
  end

  def test_input_is_nil
    actual_value   = GemVersionWrapper.build(nil)
    expected_value = Gem::Version.new('')
    assert_equal expected_value, actual_value
  end

  def test_input_empty_string
    actual_value   = GemVersionWrapper.build('')
    expected_value = Gem::Version.new('')
    assert_equal expected_value, actual_value
  end

  def test_input_number_with_string
    actual_value   = GemVersionWrapper.build('foo5')
    expected_value = Gem::Version.new('')
    assert_equal expected_value, actual_value
  end

  def test_input_string_with_number
    actual_value   = GemVersionWrapper.build('5foo')
    expected_value = Gem::Version.new('5.0')
    assert_equal expected_value, actual_value
  end

  def test_invalid_input
    actual_value   = GemVersionWrapper.build('foo')
    expected_value = Gem::Version.new('')
    assert_equal expected_value, actual_value
  end

  def test_invalid_input_2
    actual_value   = GemVersionWrapper.build('1.')
    expected_value = Gem::Version.new('1.0')
    assert_equal expected_value, actual_value
  end

  def test_invalid_input_3
    actual_value   = GemVersionWrapper.build('.3')
    expected_value = Gem::Version.new('0.3')
    assert_equal expected_value, actual_value
  end

  def test_integer
    actual_value   = GemVersionWrapper.build(15)
    expected_value = Gem::Version.new('15.0')
    assert_equal expected_value, actual_value
  end

end
