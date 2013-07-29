Ventas::Application.routes.draw do

  resources :detalles_movimientos_stocks_auxs do
    collection do
       get :autocomplete_producto_descripcion
    end
    collection do
      get :actualizar
    end
      collection do
      get :guardar_o_actualizar
    end
  end

  resources :detalles_movimientos_stocks

  resources :movimientos_stocks

  resources :tipos_movimientos

  resources :detalles_facturas_ventas_auxs do
     collection do
       get :autocomplete_producto_descripcion
    end
    collection do
      get :actualizar
    end
      collection do
      get :guardar_o_actualizar
    end
    collection do
      get :precio_producto
    end
    
  end

  resources :helps
  
  match 'logout' => 'sesiones#destroy', as: :logout
  match 'conf_new' => 'configuracions#new'
  get 'login' => 'sesiones#new', as: :login
  get "signup" => "users#new", :as => "signup"
  
  resources :clientes 
  resources :reports do
    collection do
      get :consult_between
    end
    collection do
      get :change_data
    end
    collection do
      get :alumnos
    end
  end
  resources :funcionarios
  resources :users
  resources :roles
  resources :roles_usuarios
  resources :sesiones
  resources :localidads
  resources :factura_venta do
    collection do
       get :autocomplete_cliente_nombre
    end
     member do
       get :view
    end
    collection do
      get :eliminar_factura
    end

  end
  resources :departamentos
  resources :paginas_estaticas
  resources :configuracions
  resources :productos
  resources :detalle_factura_venta  

  resources :auditorias do
    member do
      post :index
    end
  end
 
  root to: 'sesiones#new'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
