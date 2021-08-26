require './name.rb'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

class NameTest < Minitest::Test
  def test_find_by_name_regardless_of_capitalization
    # skip
    assert_equal Name.find_by_name('GIA').count, 31
    assert_equal Name.find_by_name('gia').count, 31
    assert_equal Name.find_by_name('Gia').count, 31
  end

  def test_find_by_count
    # skip
    result = Name.find_by_count(30).count
    assert_equal result, 370
  end

  def test_find_by_rank
    # skip
    result = Name.find_by_rank(3).count
    assert_equal result, 116
  end

  def test_find_by_year
    # skip
    result = Name.find_by_year(1989).count
    assert_equal result, 0
  end

  def test_where_query_name
    # skip
    result = Name.where(name: 'geraldine').count
    assert_equal result, 6
  end

  def test_where_query_rank
    # skip
    result = Name.where(rank: '15').count
    assert_equal result, 145
  end

  def test_where_query_gender
    # skip
    male = Name.where(bio_gender: "male").count
    assert_equal male, 14392

    female = Name.where(bio_gender: "female").count
    assert_equal female, 15072

    total = male + female
    assert_equal total, Name.all_names.count
  end

  def test_where_query_ethnicity
    # skip
    result = Name.where(ethnicity: 'Black Non Hispanic').count
    assert_equal result, 5324
  end

  def test_order_query_asc
    # skip
    result =  Name.order( year: :asc).first
    assert_equal result.year, '2011'

    result =  Name.order( year: :asc).last
    assert_equal result.year, '2017'
  end

  def test_order_query_desc
    # skip
    result =  Name.order( year: :desc).first
    assert_equal result.year, '2017'

    result =  Name.order( year: :desc).last
    assert_equal result.year, '2011'
  end

  def test_two_queries
    # skip
    result = Name.where(year: "2011", ethnicity: "asian and pacific islander")
    assert_equal result.count, 919
    assert_equal result.first.year, '2011'
    assert_equal result.first.ethnicity, 'asian and pacific islander'
  end

  def test_three_queries
    # skip
    result = Name.where(ethnicity: 'hispanic', year: "2011", name: "geraldine")
    assert_equal result.count, 3
    assert_equal result.first.year, '2011'
    assert_equal result.first.ethnicity, 'hispanic'
    assert_equal result.first.name, 'geraldine'
  end

  def test_four_queries
    # skip
    result = Name.where(bio_gender: 'female', ethnicity: 'hispanic', year: "2011", name: "geraldine")
    assert_equal result.count, 3
    assert_equal result.first.year, '2011'
    assert_equal result.first.ethnicity, 'hispanic'
    assert_equal result.first.name, 'geraldine'
    assert_equal result.first.bio_gender, 'female'
  end
end
