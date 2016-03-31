require "open-uri"
require "FileUtils"

module FileManager
  def self.save_image(url)
    file_name = File.basename(url)
    dir_name = "tmp"
    FileUtils.mkdir_p(dir_name) unless FileTest.exist?(dir_name)

    open("#{dir_name}/#{file_name}", 'wb') do |output|
      begin
        open(url) do |data|
            output.write(data.read)
        end
      rescue => ex
        puts "woops: #{ex}"
        next
      end
    end
  end
end
