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
  end
  
