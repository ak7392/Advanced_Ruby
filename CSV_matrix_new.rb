require 'csv'

class Feed
  def initialize(source_name, column_names = [])
    if column_names.empty?
      column_names = CSV.open(source_name, 'r', &:first)
    end
    columns = column_names.reduce({}) { |columns, col_name| columns[col_name] = []; columns }

    define_singleton_method(:columns) { column_names }

    column_names.each do |col_name|
      define_singleton_method(col_name.to_sym) { columns[col_name] }
    end

    CSV.foreach(source_name, headers: true) do |row|
      column_names.each do |col_name|
        columns[col_name] << row[col_name]
      end
    end
  end
end

feed = Feed.new('input.csv')
puts feed.columns # ["name", "age", "city"]
puts feed.name # ["Chris", "Tony"]
puts feed.age # ["43", "54"]
puts feed.city # ["Ohio", "NYC"]
