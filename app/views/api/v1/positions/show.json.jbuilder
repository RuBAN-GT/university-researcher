api_response.builder json do
  json.partial! 'api/v1/positions/shared/position', :position => @position
end
