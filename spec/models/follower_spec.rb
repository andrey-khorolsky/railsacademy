require 'rails_helper'

RSpec.describe Follower, type: :model do
  
  describe "#areUserFollowTo" do

    subject {Follower.areUserFollowTo follower_id, author_id}

    context "user are (not) follow to author" do

      let (:follower_id) { 1 }
      # let (:author_id) { 5 }

      it "user are follow to author" do
        expect(Follower.areUserFollowTo 1, 5).to eq true
        # expect(subject).to eq true
      end

      let (:author_id) { 200 }
      it "user are not follow to author" do
        expect(subject).to eq false
      end

    end

    context "user or author don't exist" do
      
      let (:follower_id) { 1 }
      let (:author_id) { 200 }
      it "author don't exist" do
        expect(subject).to eq false
      end

      let (:follower_id) { 200 }
      let (:author_id) { 1 }
      it "user don't exist" do
        expect(subject).to eq false
      end

      let (:follower_id) { 200 }
      let (:author_id) { 201 }
      it "user and author don't exist" do
        expect(subject).to eq false
      end
    end

  end

  describe "#follow" do
    
    subject { Follower.follow follower_id, author_id}

    context "user follow to author" do
      
      let (:follower_id) { 2 }
      let (:author_id) { 3 }
      let (:res) { true }

      # it{is_expected.to eq res}
      it "user follow to author" do
        # expect(follower_id).to eq 0
        # expect(author_id).to eq 0
        expect(Follower.follow 2, 3).to eq res
      end

      it "user second times follow to author" do
        Follower.follow follower_id, author_id
        expect(subject).not_to eq res
      end

      let (:author_id) { 2 }
      it "user follow up yourself" do
        expect(subject).not_to eq res
      end
    end
  end
end
