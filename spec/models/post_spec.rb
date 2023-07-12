require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#getUsersNews' do
    subject { Post.getUsersNews user_id }
    let(:res) do
      Post.where('user_id IN (?)',
                 Follower.select(:author_id).where('follower_id = ?', user_id)).order(created_at: :desc)
    end

    context 'user with news' do
      let(:user_id) { 1 }
      it { is_expected.to eq res }
    end

    context 'user without news' do
      let(:user_id) { 2 }
      it { is_expected.to eq res }
    end

    context 'user dont exist' do
      let(:user_id) { 200 }
      it { is_expected.to eq res }
    end

    context 'news - follow - news - unfolow - news' do
      user = FactoryBot.create(:user)
      let(:user_id) { user.id }

      it { is_expected.to eq res }

      Follower.follow user.id, 1
      it { is_expected.to eq res }

      Follower.unfollow user.id, 1
      it { is_expected.to eq res }
    end
  end

  describe '#hasLikeFrom' do
    let(:post) { FactoryBot.create(:post) }
    subject { post.hasLikeFrom user_id }

    it { expect(post.hasLikeFrom(1)).to eq false }
    it { expect(post.hasLikeFrom(3)).to eq false }

    it 'user are liked post' do
      Like.like post.id, 1
      Like.like post.id, 3
      expect(post.hasLikeFrom(1)).to eq true
      expect(post.hasLikeFrom(3)).to eq true
    end

    context "user don't exist" do
      let(:user_id) { 200 }
      it { is_expected.to eq false }
    end
  end

  describe '#findPostBy' do
    subject { Post.findPostsBy user_id }
    let(:res) { Post.where('user_id = ?', user_id) }

    context 'find posts by user with posts' do
      let(:user_id) { 1 }
      it { is_expected.to eq res }
    end

    context 'find posts by user without posts and create his post' do
      let(:user_id) { 2 }

      it { is_expected.to eq res }

      post = FactoryBot.create(:post)
      post.user_id = 2
      post.save
      it { is_expected.to eq res }

      post = FactoryBot.create(:post)
      post.user_id = 2
      post.save
      it { is_expected.to eq res }
    end

    context "user don't exist" do
      it { expect(Post.findPostsBy(200)).to eq [] }
      it { expect(Post.findPostsBy(0)).to eq [] }
      it { expect(Post.findPostsBy(-1)).to eq [] }
    end
  end
end
