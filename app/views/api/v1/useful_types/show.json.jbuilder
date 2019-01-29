api_response.builder json do
  json.partial! 'api/v1/useful_types/shared/useful_type', :useful_type => @useful_type
end
