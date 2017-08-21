Rails.application.routes.draw do
 

  
  get 'repprestamos/index'

  get 'estadisticaprestamos/index'

  get 'estadisticaprestamos/show'

get 'principal/inicio'

get 'menu/noautorizado'
  

  resources :validatestudents
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get 'book/list'
   get 'book/new'
   post 'book/create'
   patch 'book/update'
   get 'book/show'
   get 'book/edit'
   get 'book/delete'
   get 'book/update'
   get 'book/show_subjects'
   get 'estudiantes/destroy'
   get 'validatestudents/new'
   post 'validatestudents/create' 
   get 'estudiantes/new'
   get 'estudiantes/index'
   patch 'estudiantes/update'
   get 'estudiantes/show'
   get 'estudiantes/edit'
   post 'estudiantes/create'
   get 'estudiantes/update'
   get 'rols/list'
   get 'rols/new'
   post 'rols/create'
   patch 'rols/update'
   get 'rols/show'
   get 'rols/edit'
   get 'rols/delete'
   get 'rols/update'
   get 'asignaturas/list'
   get 'asignaturas/show'
   get 'asignaturas/new'
   post 'asignaturas/create'
   get 'asignaturas/edit'
   get 'asignaturas/update'
   patch 'asignaturas/update'
   get 'areasconocimientos/index'
   get 'areasconocimientos/show'
   get 'areasconocimientos/new'
   post 'areasconocimientos/create'
   get 'areasconocimientos/edit'
   get 'areasconocimientos/update'
   patch 'areasconocimientos/update'
   get 'libros/index'
   get 'libros/show'
   get 'libros/new'
   post 'libros/create'
   get 'libros/edit'
   get 'libros/update'
   patch 'libros/update'
   get 'libros/destroy'
   get 'libros/pdf'
   get 'prestamos/index'
   get 'prestamos/show'
   get 'prestamos/new'
   post 'prestamos/create'
   get 'prestamos/edit'
   get 'prestamos/update'
   patch 'prestamos/update'
   get 'prestamos/destroy'
   root 'principal#inicio'
   get 'usuarios/index'
   get 'usuarios/show'
   get 'usuarios/new'
   post 'usuarios/create'
   get 'usuarios/edit'
   get 'usuarios/update'
   patch 'usuarios/update'
   get 'usuarios/destroy'
   get 'buscar/show'
   get 'estadisticas/index'
   get 'estadisticas/show'
   post 'prestamos/devolucion'
 


end
