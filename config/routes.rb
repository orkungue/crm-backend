Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    mount_devise_token_auth_for 'User', at: 'auth'
    #get 'redmine/show' => 'redmine#show_partial'
    constraints format: :json do
      get 'application/get_page', :defaults => { :format => 'json' }
      get 'application/get_block_data', :defaults => { :format => 'json' }
      get 'application/get_list_block_data', :defaults => { :format => 'json' }
      get 'application/path_builder', :defaults => { :format => 'json' }
      post 'upload/fileupload' => 'upload#upload'
      get ':controller/edit/:id' => 'application#show_partial'
      get 'application/get_calc_data_options' => 'application#get_list_calc'
      post 'upload/filedelete' => 'upload#delete'
      get 'upload/filedownload/:id' => 'upload#download'
      post ':controller/update_partial' => 'application#update_partial'
      get ':controller/list/:id' => 'application#show_partial'
      get 'customer/list' => 'customer#list_partial'
      get 'list/get_listfilter' => 'list_option#get_listfilter'
      get 'list/list_setting_generator' => 'list_option#list_setting_generator'
      #get 'list/filter_list_generator' => 'list_option#filter_list_generator'
      get 'list/get_listgroup' => 'list_option#get_listgroup'
      #get 'list/group_list_generator' => 'list_option#group_list_generator'
      get 'list/get_listcalc' => 'list_option#get_listcalc'
      get 'autocomplete' => 'application#autocomplete_generator'
      get 'favorite' => 'application#get_favorites'
      post 'application/save_favorites' => 'application#save_favorites'
      get 'application/get_recent_items/:controller' => 'application#get_recent_items'
      get 'application/tcoms' => 'application#tcoms'
      post 'mail/new' => 'mail/send_mail'
      #get ':controller/edit/:id' => 'application#show_partial'
      #get ':controller/show' => 'application#show_blocks'
      #get ':controller/new' => 'application#new_partial'
    end
end
