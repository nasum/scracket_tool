require 'thor'
require './lib/db_connector.rb'

class ScracketTool < Thor
  desc "hello NAME", "say hello to NAME"
  def hello(name)
    puts "Hello #{name}"
  end

  desc "show-tables DB", "show table"
  def show_tables(db_name, host, user, pass)
    DBConnector.show_tables(db_name, host, user, pass)
  end

  desc "images QUERY", "image download"
  def images(query, host, user, pass)
    DBConnector.connect(query, host, user, pass)
  end
end

ScracketTool.start(ARGV)
