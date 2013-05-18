require 'nokogiri-plist'
require 'uri'

xml_library_location = Dir.glob(Dir.home + '/**/iTunes/iTunes Music Library.xml')
xml_library = Nokogiri::PList(open(xml_library_location.first))

xml_locations = []
xml_library["Tracks"].values.map do |t|
  location = t["Location"][/\/USB_Storage(.*)/]
  if location
    xml_locations << URI.decode(location)
  end
end

server_locations = []
Dir.glob('/Volumes/USB_Storage/Server/Music/**/*.{mp3,aiff,wav,mp4,aac,m4a}') do |f|
  server_locations << f[/\/USB_Storage(.*)/]
end

not_in_itunes = server_locations - xml_locations
puts not_in_itunes