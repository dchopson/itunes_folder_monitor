require 'nokogiri-plist'
require 'uri'

puts 'Getting the data from your iTunes library...'
library_location = Dir.glob(Dir.home + '/**/iTunes/iTunes Music Library.xml')
xml_library = Nokogiri::PList(open(library_location.first))

puts 'Adding the location of each track to an array...'
xml_locations = []
xml_library['Tracks'].values.map do |t|
  location = t['Location'].sub('file://localhost','')
  if location
    xml_locations << URI.decode(location)
  end
end

# Assumes all music is in the same directory as the first track in the library
first = xml_locations.first
music_directory = first.sub(first.split('/').last,'')

if Dir.exists?(music_directory)
  puts 'Searching for all music files in your music directory...'
  music_directory_locations = Dir.glob(music_directory + '**/*.{mp3,aiff,wav,mp4,aac,m4a}')

  puts 'Computing the tracks in your music directory that are not in your iTunes library...'
  puts music_directory_locations - xml_locations
else
  puts 'Cannot find the music directory specified by your iTunes library'
end