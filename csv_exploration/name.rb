require 'csv'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'Popular_Baby_Names.csv'

  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender].downcase
    @ethnicity = standardize_ethnicity(data[:ethnicity])
    @name = data[:childs_first_name].downcase
    @count = data[:count]
    @rank = data[:rank]
  end

  def standardize_ethnicity(ethnicity)
    ethnicity = ethnicity.downcase

    if ethnicity == "asian and paci"
      ethnicity = "asian and pacific islander"
    elsif ethnicity == "black non hisp"
      ethnicity = "black non hispanic"
    elsif ethnicity == "white non hisp"
      ethnicity = "white non hispanic"
    else
      ethnicity
    end
  end

  def self.all_names
    @all_names ||= load_name_data
  end

  def self.load_name_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)

    rows.map do |row|
      Name.new(row)
    end
  end

  def self.find_by_name(name_to_find)
    name_to_find.downcase!

    all_names.find_all do |name|
      name.name == name_to_find
    end
  end

  def self.find_by_count(count)
    all_names.find_all do |name|
      name.count.to_i == count
    end
  end

  def self.find_by_rank(rank)
    all_names.find_all do |name|
      name.rank.to_i == rank
    end
  end

  def self.find_by_year(year)
    all_names.find_all do |name|
      name.year.to_i == year
    end
  end

  def self.where(query)
    results = []
    query.each do |q|
      results << select_by_query(q)
    end
    intersection_of_query_results(results)
  end

  def self.select_by_query(q)
    find_by = q.first
    criteria = q.last.downcase
    all_names.select do |name|
      name.send(find_by) == criteria
    end
  end

  def self.intersection_of_query_results(results)
    return results.flatten if results.count == 1
    array = results.first

    results.each_with_index do |_,i|
      break if i == (results.count - 1)
      array = array & results[i+1]
    end
    array
  end

  def self.order(query)
    sort_by = query.keys.first
    direction = query[sort_by].downcase
    asc_sorted = all_names.sort_by do |name|
      name.send(sort_by)
    end
    asc_sorted.reverse! if direction == :desc

    asc_sorted
  end
end
