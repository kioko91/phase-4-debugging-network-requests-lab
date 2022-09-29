class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_handler
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_handler
 
    private
 
    def not_found_handler(e)
       render json: { message: e.record.error }, status: :not_found
    end
 
    def invalid_handler(e)
       render json: { messages: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
