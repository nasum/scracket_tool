require 'mysql2'
require './lib/file_manager.rb'
include FileManager

module DBConnector
  def self.connect(query, host, user, pass)
    client = Mysql2::Client.new(host: host, user: user, password: pass)
    results = client.query(query)
    results.each do |row|
      puts "--------------------"
      row.each_value do |value|
        puts "#{value}"
        FileManager.save_image(value)
      end
    end
  end
end
