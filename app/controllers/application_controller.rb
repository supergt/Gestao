class ApplicationController < ActionController::Base
  layout Proc.new { |controller| controller.request.xhr? ? nil : 'application' }
end