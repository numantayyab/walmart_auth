require 'httparty'

module WalmartAuth

	class HttpRequest
		attr_accessor :url, :data

		BASE_URL = "https://marketplace.walmartapis.com/v2/"

		def submit(client, methd = nil)
	      	response = HTTParty.public_send(request_method(methd), url(client), request_options(client))
	      	verify_response(response)
	      	parse_response(response)
    	end

    	## default will be a GET request. Can be used for other REST APIs as well.
    	def request_method(meth = 'GET')
    		meth
    	end

    	## the endpoint will be embeded on the base url. 
    	def url(end_point)
    		BASE_URL + end_point
    	end
	end


end