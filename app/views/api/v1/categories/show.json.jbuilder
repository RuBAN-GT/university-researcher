api_response.builder json do
  json.partial! 'api/v1/categories/shared/category', :category => @category
end
