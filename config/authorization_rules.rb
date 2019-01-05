authorization do
    role :admin do
      has_permission_on [:films, :sections, :companies], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :ajax_edit, :drafts, :tweet, :destroy_film_cover, :destroy_company_logo, :lucky, :embed, :app, :resize]
    #   has_permission_on :users,  :to => [:new, :create, :edit, :update]
    #   has_permission_on :user_sessions, :to => [:new, :create, :destroy]
    #   has_permission_on [:editors, :filmcompanies, :filmers, :riders, :songs], :to => [:list, :show, :create, :destroy]
    #   has_permission_on :people, :to => [:index, :show, :edit, :update]
    #   has_permission_on :songlists, :to => [:index, :show, :get_artist, :edit, :update]
    #   has_permission_on :user_sessions, :to => [:new, :create, :destroy, :contact]
    #   has_permission_on :sections, :to => [:show], :context => :films  
    #   has_permission_on :company_pictures, :to => [:new, :create, :index, :destroy]
    #   has_permission_on :affiliates, :to => [:new, :create]
    #   has_permission_on :posts, :to => [:index, :show, :new, :edit, :create, :update, :destroy, :tweet]
    #   has_permission_on :answers, :to => [:new, :create, :index, :destroy]
    #   has_permission_on :categories, :to => [:index, :show, :new, :edit, :create, :update, :destroy]
    #   has_permission_on :favourites, :to => [:index, :create, :destroy]
    #   has_permission_on :watchlists, :to => [:index, :create, :destroy]
    end
    
    role :blogger do
    #   includes :author
    #   has_permission_on :posts, :to => [:index, :show, :new, :edit, :create, :update, :destroy, :tweet]
    end
    
    role :guest do
      has_permission_on :films, :to => [:index, :lucky]
      
      has_permission_on :sections, :to => [:show, :embed,:app, :resize]
      
      has_permission_on :films, :to => [:show] do
        if_attribute :draft => is {false}
      end
      has_permission_on :songlists, :to => [:show]
      has_permission_on :user_sessions, :to => [:new, :create, :contact]
      has_permission_on :users, :to => [:new, :create]
      has_permission_on :people, :to => [:index, :show]
      has_permission_on [:editors, :filmcompanies, :filmers, :riders, :songs, :companies], :to => [:list, :show, :index]
      has_permission_on :posts, :to => [:index, :show]
      has_permission_on :answers, :to => [:new, :create, :index]
      has_permission_on :categories, :to => [:index, :show]
    end
    
    role :author do
    #   has_permission_on [:films], :to => [:index, :new, :create, :lucky]
    #   has_permission_on [:sections, :companies], :to => [:index, :show, :new, :create, :embed,:app, :resize]
    #   has_permission_on :songlists, :to => [:show, :get_artist]
    #   has_permission_on :films, :to => [:show] do
    #        if_attribute :draft => is {false}
    #        if_attribute :draft => is {true}, :user => is {user}
    #      end
      
    #   has_permission_on :users,  :to => [:edit, :update]
    #   has_permission_on :user_sessions, :to => [:new, :create, :destroy, :about]
    #   has_permission_on [:films], :to => [ :edit, :update] do
    #     if_attribute :user => is {user}
    #     has_permission_on :sections, :to => [:update, :edit, :destroy]
    #   end
      
    #   has_permission_on :people, :to => [:index, :show]
    #   has_permission_on [:editors, :filmcompanies, :filmers, :riders, :songs], :to => [:list, :show, :create, :destroy]
    #   has_permission_on :posts, :to => [:index, :show]
    #   has_permission_on :answers, :to => [:new, :create, :index]
    #   has_permission_on :categories, :to => [:index, :show]
    #   has_permission_on :favourites, :to => [:index, :create, :destroy]
    #   has_permission_on :watchlists, :to => [:index, :create, :destroy]
    end
    
    
  end
  