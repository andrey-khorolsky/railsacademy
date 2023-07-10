require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#findLikes' do
    subject { Like.findLikes post_id }

    context 'post has some likes' do
      let(:post_id) { 4 }
      it { is_expected.to eq 2 }
    end

    context "post hasn't like" do
      let(:post_id) { 1 }
      it { is_expected.to eq 0 }
    end

    context 'post not exist' do
      let(:post_id) { 0 }
      it { is_expected.to eq 0 }
    end
  end

  describe '#arePostLikedBy' do
    subject { Like.arePostLikedBy post_id, user_id }
    let(:post_id) { 3 }

    context 'user are liked post' do
      let(:user_id) { 1 }

      it { is_expected.to eq true }
    end

    context "user don't liked post" do
      let(:user_id) { 3 }

      it { is_expected.to eq false }
    end

    context "user or post don't exist" do
      it { expect(Like.arePostLikedBy(1, 200)).to eq false }

      it { expect(Like.arePostLikedBy(200, 1)).to eq false }
    end
  end

  describe '#like' do
    subject { Like.like post_id, user_id }
    let(:post_id) { 4 }

    context 'user like post' do
      let(:user_id) { 1 }

      it { is_expected.to eq true }

      it 'user second time like post' do
        Like.like post_id, user_id
        expect(subject).to eq false
      end

      # it { should validate_uniqueness_of(:user_id).scoped_to(:post_id)}
    end

    context "user don't exist" do
      let(:user_id) { 200 }
      it "user don't exist" do
        expect { subject }.to raise_error
      end

      # it {is_expected.to raise_error}
    end

    context "post don't exist" do
      let(:post_id) { 200 }
      let(:user_id) { 1 }
      it "post don't exist" do
        expect { subject }.to raise_error
      end
      # it { is_expected.to raise_error}
    end
  end

  describe '#dislike' do
    subject { Like.dislike post_id, user_id }

    let(:post_id) { 3 }
    let(:user_id) { 1 }
    let(:res) { 1 }

    context 'user dislike post' do
      it 'user first time dislike post' do
        expect(subject).to eq res
      end

      it 'user second time dislike post' do
        Like.dislike post_id, user_id
        expect(subject).to eq 0
      end

      it 'do some likes and one dislike' do
        Like.like post_id, user_id
        Like.like post_id, user_id
        expect(subject).to eq res
      end
    end

    context "user don't exist" do
      let(:user_id) { 200 }

      it { is_expected.to eq 0 }
    end

    context "post don't exist" do
      let(:post_id) { 200 }
      let(:user_id) { 1 }

      it { is_expected.to eq 0 }
    end
  end
end
