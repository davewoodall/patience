class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  rescue_from ActiveRecord::RecordNotFound, with: -> { head :not_found }
end

