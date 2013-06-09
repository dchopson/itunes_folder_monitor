require 'nokogiri-plist'
require 'uri'

xml_library_location = Dir.glob(Dir.home + '/**/iTunes/iTunes Music Library.xml')
xml_library = Nokogiri::PList(open(xml_library_location.first))

xml_locations = []
xml_library['Tracks'].values.map do |t|
  location = t['Location'].sub('file://localhost','')
  if location
    xml_locations << URI.decode(location)
  end
end

first = xml_locations.first
music_directory = first.sub(first.split('/').last,'')
if Dir.exists?(music_directory)
  music_directory_locations = Dir.glob(music_directory + '**/*.{mp3,aiff,wav,mp4,aac,m4a}')
  puts music_directory_locations - xml_locations
else
  puts 'Cannot find the music directory specified by your iTunes library'
end