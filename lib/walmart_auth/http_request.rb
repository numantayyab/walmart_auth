=begin
    
    We are using HttParty to make api requests. The idea is to create a dumy class which 
    will be called with the end point and desired data.    

=end

require 'httparty'

module WalmartAuth

	class HttpRequest
		attr_accessor :url, :data

		BASE_URL = "https://marketplace.walmartapis.com/v2/"

		## submit request
        def submit(client, methd = nil)
	      	response = HTTParty.public_send(request_method(methd), url(client), request_options(client))
    	end

    	## default will be a GET request. Can be used for other REST APIs as well.
        ## values can be :get, :post, :put etc
    	def request_method(meth = :get)
    		meth
    	end

    	## the endpoint will be embeded on the base url. 
    	def url(end_point)
    		BASE_URL + end_point
    	end
	end


end