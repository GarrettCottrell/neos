require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'astroid_api_data'

class AsteroidApiDataTest < Minitest::Test
  def test_find_data
    results = AsteroidApiData.find_data('2019-03-30')
    assert_equal "2019-03-30", results.params["start_date"]
  end

  def test_asteroids_list_data
    results = AsteroidApiData.asteroids_list_data('2019-03-30')
    assert_equal "", results.reason_phrase
  end

  def test_parsed_asteroids_data 
    results = AsteroidApiData.parsed_asteroids_data('2019-03-30')
    assert_equal "3561029", results[0][:id]
  end

  def test_largest_astroid 
    results = AsteroidApiData.largest_astroid('2019-03-30')
    assert_equal 537, results
  end

  def test_total_number_of_astroids
    results = AsteroidApiData.total_number_of_astroids('2019-03-30')
    assert_equal 10, results
  end

  def test_formatted_asteroid_data
    results = AsteroidApiData.formatted_asteroid_data('2019-03-30')
    assert_equal '(2011 GE3)', results[0][:name]
  end

  def test_selected_astroid_data
    results = AsteroidApiData.selected_astroid_data('2019-03-30')
    assert_equal '(2011 GE3)', results[:astroid_list][0][:name]
  end
end
