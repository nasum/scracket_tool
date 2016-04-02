require 'thor'
require './lib/db_connector.rb'

class ScracketTool < Thor
  desc "hello NAME", "say hello to NAME"
  def hello(name)
    puts "Hello #{name}"
  end

  desc "show-tables DBNAME", "show table"
  option :h
  option :u
  option :p
  def show_tables(db_name)
    DBConnector.show_tables(db_name, options[:h], options[:u], options[:p])
  end

  desc "images QUERY", "image download"
  option :h
  option :u
  option :p
  def images(query)
    DBConnector.connect(query, options[:h], options[:u], options[:p])
  end
end

ScracketTool.start(ARGV)
