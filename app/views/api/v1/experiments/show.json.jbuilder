api_response.builder json do
  json.partial! 'api/v1/experiments/shared/experiment', :experiment => @experiment
end
