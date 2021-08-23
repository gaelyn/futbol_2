require './name.rb'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

class NameTest < Minitest::Test
  def test_find_by_name_regardless_of_capitalization
    assert_equal Name.find_by_name('GIA').count, 31
    assert_equal Name.find_by_name('gia').count, 31
    assert_equal Name.find_by_name('Gia').count, 31
  end

  def test_find_by_count
    result = Name.find_by_count(3)
    assert_equal result, 30
  end

  def test_find_by_rank
    result = Name.find_by_rank(3)
    assert_equal result, 30
  end

  def test_find_by_year
    result = Name.find_by_year(1989)
    assert_equal result, 30
  end

end
