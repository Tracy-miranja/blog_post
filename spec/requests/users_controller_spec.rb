require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'assigns @users' do
      user = User.create(name: 'John Doe')
      get :index, format: :html
      expect(response).to be_successful
      expect(assigns(:users)).to include(user)
    end

    it 'responds with status :ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    it 'assigns @users' do
      user = User.create(name: 'John Doe')
      get :show, params: { id: user.id }
      expect(response).to be_successful
      expect(assigns(:user)).to eq(user)
    end

    it 'responds with status :ok' do
      user = User.create(name: 'John Doe')
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      user = User.create(name: 'John Doe')
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end
end
