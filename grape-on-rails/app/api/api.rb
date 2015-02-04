class API < Grape::API
  format :json
  mount Course::V1
end
