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
    result = Name.find_by_count(30).count
    assert_equal result, 370
  end

  def test_find_by_rank
    result = Name.find_by_rank(3).count
    assert_equal result, 116
  end

  def test_find_by_year
    result = Name.find_by_year(1989).count
    assert_equal result, 0
  end

  def test_where_query
    result = Name.where(name: 'geraldine').count
    assert_equal result, 6

    result = Name.where(year: 2012).count
    assert_equal result, 5859

    result = Name.where(rank: 1).count
    assert_equal result, 103
  end
end
