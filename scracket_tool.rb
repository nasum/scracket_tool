require 'thor'
require './lib/db_connector.rb'

class ScracketTool < Thor
  desc "hello NAME", "say hello to NAME"
  def hello(name)
    puts "Hello #{name}"
  end

  desc "images QUERY", "image download"
  def images(query, host, user, pass)
    DBConnector.connect(query, host, user, pass)
  end
end

ScracketTool.start(ARGV)
