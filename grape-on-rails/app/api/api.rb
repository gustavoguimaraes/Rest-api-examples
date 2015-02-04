class API < Grape::API
  format :json
  mount Todos::V1
end
