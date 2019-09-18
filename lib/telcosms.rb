require "telcosms/version"
require "httparty"

module Telcosms
	include HTTParty
	base_uri "196.216.53.194:9501"
  
  # send a message
  def self.new_sms(numbers, message, username, password, servico)
  	numbers.each do |number|
  		post("/api?action=sendmessage&username=#{username}&password=#{password}&recipient=#{number}&messagetype=SMS:TEXT&messagedata=#{message}&originator=#{servico}", :headers => {'Content-Type' => 'application/json'}).parsed_response
	end
  end
  
  # check balance
  def self.check_balance(username, password)
  	post("/api?action=getcredits&username=#{username}&password=#{password}&useraccount=#{username}", :headers => {'Content-Type' => 'application/json'}).parsed_response
  end	
end
