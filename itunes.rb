require 'nokogiri-plist'
require 'uri'

library_xml = Nokogiri::PList(open('/Users/dchopson/Music/iTunes/iTunes Music Library.xml'))

xml_locations = []
library_xml["Tracks"].values.map do |t|
  xml_locations << URI.decode(t["Location"].gsub('file://localhost',''))
end

server_locations = []
Dir.glob('/Volumes/USB_Storage/Server/Music/**/*.{mp3,aiff,wav,mp4,aac,m4a}') do |f|
  server_locations << f
end

not_in_itunes = server_locations - xml_locations
puts not_in_itunes