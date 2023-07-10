require 'rails_helper'

RSpec.describe Follower, type: :model do
  describe '#areUserFollowTo' do
    subject { Follower.areUserFollowTo follower_id, author_id }

    context 'user are follow to author' do
      let(:follower_id) { 1 }
      let(:author_id) { 5 }
      it { is_expected.to eq true }
    end

    context 'user not follow to author' do
      let(:follower_id) { 1 }
      let(:author_id) { 200 }

      it { is_expected.to eq false }
    end

    context "author don't exist" do
      let(:follower_id) { 1 }
      let(:author_id) { 200 }

      it { is_expected.to eq false }
    end

    context "user don't exist" do
      let(:follower_id) { 200 }
      let(:author_id) { 1 }

      it { is_expected.to eq false }
    end

    context "user and author don't exist" do
      let(:follower_id) { 200 }
      let(:author_id) { 201 }

      it { is_expected.to eq false }
    end
  end

  describe '#follow' do
    subject { Follower.follow follower_id, author_id }
    let(:res) { true }

    context 'normal follow' do
      let(:follower_id) { 2 }
      let(:author_id) { 3 }

      it { is_expected.to eq res }

      it 'user second times follow to author' do
        Follower.follow follower_id, author_id
        expect(subject).not_to eq res
      end
    end

    # context "uniquness follow" do
    #   subject { FactoryBot.create(:follower)}
    #   it { should validate_uniqueness_of(:author_id).scoped_to(:follower_id)}
    # end

    context 'user follow to yourself' do
      let(:author_id) { 2 }
      let(:follower_id) { 2 }
      it { is_expected.not_to eq res }
    end
  end

  describe '#unfollow' do
    subject { Follower.unfollow follower_id, author_id }
    let(:author_id) { 1 }

    context 'follower unfollow on author' do
      let(:follower_id) { 6 }

      it { is_expected.to eq 1 }

      it 'twice unfollow' do
        Follower.unfollow follower_id, author_id
        expect(subject).to eq 0
      end
    end

    context "user don't follow to author" do
      let(:follower_id) { 3 }

      it { is_expected.to eq 0 }
    end

    it { expect(Follower.unfollow(1, 1)).to eq 0 }
  end
end
