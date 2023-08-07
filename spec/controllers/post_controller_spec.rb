require 'rails_helper'

RSpec.describe PostController, type: :controller do
  describe 'POST create' do
    let(:user) { FactoryBot.create(:user) }
    let(:newpost) { FactoryBot.create(:post) }

    before do
      subject.sign_in user
      post :create, params: { post: { text: newpost.text, img: nil } }
    end

    it { should respond_with 302 }

    it {
      expect(Post.where('created_at = ? and user_id = ? and text = ?', newpost.created_at, newpost.user_id,
                        newpost.text).count).to eq 1
    }
  end

  describe 'GET show' do
    let(:user) { FactoryBot.create(:user) }
    before do
      subject.sign_in user
      get :show, params: { id: 3 }
    end

    it { should respond_with 200 }
    it { should render_template 'show' }
    it { assert_equal Post.find(3), assigns(:post) }

    context 'go to not exists page' do
      before { get :show, params: { id: 1000 } }
      it { is_expected.to respond_with 302 }
      it { should redirect_to(controller: :news, action: :index) }
    end
  end

  describe 'GET like' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post) }
    before do
      subject.sign_in user
      get :like, params: { id: post.id }
    end

    it { should respond_with 302 }
    it { expect(Like.where('post_id = ? and user_id =?', post.id, user.id).count).to eq 1 }

    context 'invalid params' do
      before do
        get :like, params: { id: 0 }
      end

      it { should respond_with 302 }
      it { expect(Like.where('post_id = ? and user_id =?', 0, user.id).count).to eq 0 }
    end
  end

  describe 'GET dislike' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post) }
    before do
      subject.sign_in user
      get :like, params: { id: post.id }
      get :dislike, params: { id: post.id }
    end

    it { should respond_with 302 }
    it { expect(Like.where('post_id = ? and user_id =?', 1, user.id).count).to eq 0 }

    context 'invalid params' do
      before do
        get :like, params: { id: 0 }
        get :dislike, params: { id: 0 }
      end

      it { should respond_with 302 }
      it { expect(Like.where('post_id = ? and user_id =?', 0, user.id).count).to eq 0 }
    end
  end

  describe 'POST addComment' do
    let(:user) { FactoryBot.create(:user) }
    let(:newpost) { FactoryBot.create(:post) }
    let(:newcomm) { FactoryBot.create(:comment) }

    before do
      subject.sign_in user
      newcomm.post_id = newpost.id
      post :create, params: { post: { text: newpost.text, img: nil } }
      post :addComment, params: { comment: { text: newcomm.text }, id: newpost.id }
    end

    it { should respond_with 302 }

    it { expect(Comment.where('post_id = ? and text = ?', newcomm.post_id, newcomm.text).count).to eq 1 }

    context 'user wanna spam' do
      it 'try' do
        newcomm.text = 'spam spam'
        post :addComment, params: { comment: { text: newcomm.text }, id: newpost.id }
        post :addComment, params: { comment: { text: newcomm.text }, id: newpost.id }
        expect(response).to be_redirect
        expect(Comment.where('post_id = ? and text = ?', newcomm.post_id, newcomm.text).count).to eq 1
      end
    end
  end

  describe 'closed urls' do
    let(:user) { FactoryBot.create(:user) }
    before do
      subject.sign_in user
    end

    it 'delete post' do
      # it {expect(delete :destroy, params: {id: 3}).to raise_error}
      # expect(Post.find(3).nil?).to eq false
      # expect(delete :destroy, params: {id: 3}).to raise_error(ActionController::UrlGenerationError)
      # expect(Post.find(3).nil?).to eq false
    end

    it 'delete user' do
      # it {expect(delete :destroy, params: {id: 3}).to raise_error}
      # expect(Post.find(3).nil?).to eq false
      # expect(delete :destroy, params: {id: 3}).to raise_error(ActionController::UrlGenerationError)
      # expect(Post.find(3).nil?).to eq false
    end
  end
end
