require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'assigns @users' do
      user = User.create(name: 'John Doe')
      get :index
      expect(response).to be_successful
      expect(assigns(:users)).to eq([user])
    end
  end
end
