api_response.builder json do
  json.partial! 'api/v1/genetic_markers/shared/genetic_marker', :genetic_marker => @genetic_marker
end
