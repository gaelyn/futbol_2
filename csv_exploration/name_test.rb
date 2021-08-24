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

  def test_where_query_name
    result = Name.where(name: 'geraldine').count
    assert_equal result, 6
  end

  def test_where_query_rank
    result = Name.where(rank: '15').count
    assert_equal result, 145
  end

  def test_where_query_gender
    male = Name.where(bio_gender: "male").count
    assert_equal male, 14392

    female = Name.where(bio_gender: "female").count
    assert_equal female, 15072

    total = male + female
    assert_equal total, Name.all_names.count
  end

  def test_where_query_ethnicity
    result = Name.where(ethnicity: 'Black Non Hispanic').count
    assert_equal result, 4290
  end
end
