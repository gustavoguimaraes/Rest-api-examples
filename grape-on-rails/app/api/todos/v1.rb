module Todos
  class V1 < Grape::API
    resources :todos do
    #index
    get do
      Todo.all
    end
    #show
    get ':id' do
      Todo.find(params[:id])
    end
    #create
    post do
      todo = Todo.create(params[:todo])
      if todo.errors.empty?
        todo
      else
        error!({errors: todo.errors})
      end
    end
    # update
    put ':id' do
      todo = Todo.find(params[:id])

      if todo.update(params[:todo])
        todo
      else
        error!({errors: todo.errors})
      end
    end
    #destroy
    delete ':id' do
      Todo.destroy(params[:id])
      body false
    end
  end
  end
end
