require "walmart_auth/client"
require "walmart_auth/http_request"

## we can use this class to send requests to different APIs. An implementation of Walmart is as below

class StoreAuth

	def initialize(store_type)
	end

	case store_type
	
		when "walmart"
			walmart_obj = WalmartAuth::GenerateSignature.new({endpoint: "feeds", http_method: "GET"})
			walmart_obj.get_signature
			walmart_obj.headers = {
				"WM_CONSUMER.INTIMESTAMP": self.time_stamp,
				"WM_SEC.AUTH_SIGNATURE": walmart_obj.signature
			}
			
			resp = walmart_obj.submit_request(headers: walmart_obj.headers, body: {}, http_method: :get, url: walmart_obj.url)
			## further implementation goes here
		else #TODO implement other classes here
			#all other stores can be dealt with here.
	end

end

