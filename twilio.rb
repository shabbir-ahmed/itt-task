require 'rubygems'
require 'twilio-ruby'

account_sid = "AC2ec959ad39f48efb4f342faa0a464175"
auth_token = "1a98402942498234560d83d3ded0544e"
client = Twilio::REST::Client.new account_sid, auth_token

from = "+13092444419" # Your Twilio number

friends = {
"+8801714698679" => "Shabbir Ahmed"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!",
	:media_url => "https://demo.twilio.com/owl.png"
  )
  puts "Sent message to #{value}"
end