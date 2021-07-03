class ApiController < ApplicationController
  before_action :set_default_format
  before_action :authenticate_user!
end

private

def set_default_format
  request.format = :json
end
