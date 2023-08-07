require 'rails_helper'

RSpec.describe UserController, type: :controller do
  describe 'GET index' do
    let(:user) { FactoryBot.create(:user) }
    before do
      subject.sign_in user
      get :index
    end

    it { should respond_with 200 }
    it { should render_template 'index' }
    it { assert_equal User.all, assigns(:user) }
  end

  describe 'GET show' do
    let(:user) { FactoryBot.create(:user) }
    let(:someuser) { FactoryBot.create(:user) }
    before do
      subject.sign_in user
      get :show, params: { id: someuser.id }
    end

    it { should respond_with 200 }
    it { should render_template 'show' }

    it { assert_equal User.find(someuser.id), assigns(:user) }
    it { assert_equal (Follower.areUserFollowTo user.id, someuser.id), assigns(:follower) }
    it { assert_equal Post.findPostsBy(someuser.id).order(created_at: :desc), assigns(:posts) }
    it {
      assert_equal [
        Post.where('user_id = ?', user.id).count,
        Follower.where('author_id = ?', user.id).count,
        Follower.where('follower_id = ?', user.id).count
      ], assigns(:metrics)
    }

    context 'go to not exists page' do
      before { get :show, params: { id: 1000 } }
      it { is_expected.to respond_with 302 }
      it { should redirect_to(controller: :user, action: :index) }
    end

    context 'visit my own page' do
      before { get :show, params: { id: user.id } }
      it { should respond_with 200 }
      it { should render_template 'show' }
      it { assert_equal Post.findPostsBy(user.id).order(created_at: :desc), assigns(:posts) }
      it {
        assert_equal [
          Post.where('user_id = ?', user.id).count,
          Follower.where('author_id = ?', user.id).count,
          Follower.where('follower_id = ?', user.id).count
        ], assigns(:metrics)
      }
    end
  end

  describe 'GET follow' do
    let(:user) { FactoryBot.create(:user) }
    let(:someuser) { FactoryBot.create(:user) }
    before do
      subject.sign_in user
      get :follow, params: { id: someuser.id }
    end

    it { should respond_with 302 }
    # it { should redirect_to(controller: :news, action: :index) }
    it { expect(Follower.where('follower_id = ? and author_id = ?', user.id, someuser.id).count).to eq 1 }

    context 'second follow' do
      before { get :follow, params: { id: someuser.id } }
      it { should respond_with 302 }
      it { expect(Follower.where('follower_id = ? and author_id = ?', user.id, someuser.id).count).to eq 1 }
    end
  end

  describe 'GET unfollow' do
    let(:user) { FactoryBot.create(:user) }
    let(:someuser) { FactoryBot.create(:user) }
    before do
      subject.sign_in user
      get :follow, params: { id: someuser.id }
      get :unfollow, params: { id: someuser.id }
    end

    it { should respond_with 302 }
    it { should redirect_to(controller: :news, action: :index) }
    it { expect(Follower.where('follower_id = ? and author_id = ?', user.id, someuser.id).count).to eq 0 }

    context 'second unfollow' do
      before { get :unfollow, params: { id: someuser.id } }
      it { should respond_with 302 }
      it { expect(Follower.where('follower_id = ? and author_id = ?', user.id, someuser.id).count).to eq 0 }
    end
  end
end
