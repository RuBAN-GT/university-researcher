api_response.builder json do
  json.partial! 'api/v1/primers/shared/primer', :primer => @primer
end
