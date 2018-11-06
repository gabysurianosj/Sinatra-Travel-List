class UsersController < ApplicationController
  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    params.each do |attribute, value| 
      if value.empty?
        redirect to '/signup'
      end
    end

    User.create(:name => params["name"], :email => ["email"], :password => ["password"])
    # Then login the user - so start a session with the user

    redirect to '/experiences'
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    params.each do |attribute, value|
      if value.empty?
        redirect to '/login'
      end
    end
    user = User.find_by(:email => params["email"])
    # Authenticate that the user's password is correct
    # If so, set that user's session
    # If not, redirect them to the login page to try again
  end
end
