class ApplicationController < ActionController::API

    def app_response(message: 'success', status: 200, data: nill)
        render json: { 
            message: message,
            data: data
        }, status: status

    end
end
