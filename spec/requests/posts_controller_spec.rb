RSpec.describe 'Controllers', type: :request do
  describe 'PostsController' do
    describe 'GET #index' do
      it 'returns a successful response' do
        get posts_path
        expect(response).to be_successful
      end

      it 'renders the index template' do
        get posts_path
        expect(response).to render_template(:index)
      end

      it 'includes correct placeholder text in the response body' do
        get posts_path
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
