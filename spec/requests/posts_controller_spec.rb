RSpec.describe 'Controllers', type: :request do
  describe 'PostsController' do
    describe 'GET #index' do
      let(:user) { User.create(name: 'John Doe') }
      it 'returns a successful response' do
        get user_posts_path(user) # Use the nested route helper
        expect(response).to be_successful
      end

      it 'renders the index template' do
        get user_posts_path(user) # Use the nested route helper
        expect(response).to render_template(:index)
      end

      it 'includes correct placeholder text in the response body' do
        get user_posts_path(user) # Use the nested route helper
        expect(response.body).to include('Display posts')
      end
    end
  end
  describe 'GET show' do
    it 'returns a successful response' do
      user = User.create(name: 'John Doe')
      post = user.posts.create(title: 'Hello, World!')

      get user_post_path(user_id: user.id, id: post.id)

      expect(response).to have_http_status(:ok)
    end
  end
end
