require 'spec_helper'

describe UsersController do
  describe 'routing' do

    it 'routes to #index' do
      get('/users').should route_to('users#index')
    end

    it 'routes to #new' do
      get('/users/new').should_not route_to('users#new')
    end

    it 'routes to #show' do
      get('/users/1').should route_to('users#show', :id => '1')
    end

    it 'routes to #edit' do
      get('/users/1/edit').should route_to('users#edit', :id => '1')
    end

    it 'routes to account edit' do
      get('/users/edit').should route_to 'devise/registrations#edit'
    end

    it 'routes to #create' do
      post('/users').should route_to 'devise/registrations#create'
    end

    it 'routes to #update' do
      put('/users/1').should route_to 'users#update', :id => '1'
    end

    it 'routes to account update' do
      put('/users').should route_to 'devise/registrations#update'
    end

    it 'routes not to #destroy' do
      delete('/users/1').should_not be_routable
    end

  end
end
