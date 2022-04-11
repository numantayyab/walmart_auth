#gem 'httparty'

# gem 'openssl_pkcs8'

## steps to do:
=begin

1) Get consumer_id and Base64 encoded private key
2) set full url 
3) Method type will be get here
4) The Consumer ID issued to you_ + “\n” + the URL of the API call you are making 
	+ “\n” + the request method of the API call you are making in all capitals 
		+ “\n” + the Unix Epoch timestamp now
=end

require 'walmart_auth/http_request'
include WalmartAuth::HttpRequest

module WalmartAuth

	class GenerateSignature

		BASE_URL = "https://marketplace.walmartapis.com/v2/"

		attr_accessor :private_str, :consumer_id, :endpoint
		attr_accessor :http_method, :url, :headers, :body
		attr_accessor :signature, :time_stamp

		def initialize(**params)
			# @private_str = "bXlleGFtcGxlYmFzZTY0c3RyaW5n" ## test data
			# @consumer_id = "123344" ## test data
			@private_str = Base64.decode64(ENV['private_encoded_str'])
			@consumer_id = ENV["consumer_id"]
			@endpoint = params[:endpoint]
			@http_method = params[:http_method] || "GET"
			@url = BASE_URL + @endpoint
		end

		def get_signature

			## we will be building our API call now
			epoch_time = Time.now.to_i * 1000 ## to convert it into miliseconds

			string_to_sign = ""

			#instead of one string with multiple variables, I have broken it down for better understanding.

			string_to_sign << consumer_id
			string_to_sign << "\n"
			string_to_sign << BASE_URL + "/#{endpoint}"
			string_to_sign << "\n"
			string_to_sign << http_method ## Get in case of feeds
			string_to_sign << "\n"
			string_to_sign << epoch_time.to_s
			string_to_sign << "\n"

			key = OpenSSL::PKey::RSA.new(1024)

			key.to_pem_pkcs8
			digest = OpenSSL::Digest::SHA256.new
			auth_signature = nil
			auth_signature = key.sign(digest,string_to_sign)

			self.signature = Base64.strict_encode64(auth_signature)
			self.time_stamp = epoch_time
		end


	end
end