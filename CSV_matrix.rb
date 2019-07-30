require 'csv'

class FeedGenerator
  attr_accessor :source, :feed, :current_row

  def initialize(source_name, feed_name)
    @source = CSV.read(source_name, headers: true)
    @current_row = Row.new
    @feed = []

    # define method by header of source file
    @source.headers.each do |column|
      @current_row.instance_eval do
        define_singleton_method(column) do
          self.row[column]
        end
      end
    end

    @feed = CSV.open(feed_name, 'wb+')
    @feed << columns
  end

  def columns
     %w(name age city)
  end

  def generate_feed
    @source.each do |row|
      @current_row.row = row
      @feed << columns.map do |c|
        @current_row.send(c)
      end
    end
  end

  def columns; raise 'unimplimented'; end

  class Row
    attr_accessor :row

    # you can define unrecognized column mapping below
    def name; name; end
    def age; age; end
    def city; city; end
  end
end
class StarkFeedGenerator < FeedGenerator
  def columns; %w(name); end
end

StarkFeedGenerator.new('Input.csv','new_feed.csv').generate_feed
b = Row.new
b.name
