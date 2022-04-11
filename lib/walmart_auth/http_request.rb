=begin
    
    We are using HttParty to make api requests. The idea is to create a dumy class which 
    will be called with the end point and desired data.    

=end

require 'httparty'

module WalmartAuth

	class HttpRequest
		attr_accessor :response, :error, :data

		## submit request
        def submit_request(**params)
	      	response = HTTParty.public_send(request_method(params[:http_method]), params[:url],headers: params[:header],
             body: params[:body])
            validate_response
    	end

    	## default will be a GET request. Can be used for other REST APIs as well.
        ## values can be :get, :post, :put etc
    	def request_method(meth = :get)
    		meth
    	end

        def validate_response
            case response.code
            when 200...300 || 302
                self.data = response.body
                return true
            else
                self.error = response.error
                return false
            end
        end
	end


end