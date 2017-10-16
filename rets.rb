

require 'rets'

client = Rets::Client.new({
  login_url: 'http://matrixrets.swflamls.com/rets/Login.ashx',
  username: 'NAPMLS100600NRDR',
  password: 'em2017nr5dr15',
  version: 'RETS/1.7.2',
  logger: Logger.new(STDOUT)
})

# begin
    # client.login
# rescue => e
    # puts 'Error: ' + e.message
    # exit!
# end

puts 'We connected! Lets get all the photos for a property...'

photos = client.find (:all), {
	search_type: 'Media',
	resource: 'Media',
	class: 'MEDIA',
	query: '(matrix_unique_id=0+)(Type=Image)'
	#limit: 20
}
photos.each do |photo|
	puts photo
end

# photos.each_with_index do |data, index|
	# photo =  data['OriginalFilename']
	# require 'base64'
	# image = Base64.encode64(photo)
	# File.open("property-#{index.to_s}.jpg", 'wb') do |f|
		# f.write(Base64.decode64(image))
	# end
# end

# photos.each_with_index do |data, index|
  # photo = open(photo = data['MediaURL'])
  # puts data['MediaURL']
  # require 'base64'
  # image = Base64.encode64(photo.read)
  # File.open("property-#{index.to_s}.jpg", 'wb') do |f|
    # f.write(Base64.decode64(image))
  # end
# end


puts photos.length.to_s + ' photos'
client.logout

