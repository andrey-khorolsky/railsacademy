require 'rails_helper'

RSpec.describe Like, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "#findLikes" do

    subject { Like.findLikes post_id }


    context "post has some likes" do

      let (:post_id) { 4 }

      it "find post's likes" do
        expect(subject).to eq(2)
      end
    end


    context "post hasn't like" do

      let (:post_id) { 1 }

      it "find post's likes" do
        expect(subject).to eq(0)
      end
    end


    context "post not exist" do

      let (:post_id) { 0 }

      it "find post's likes" do
        expect(subject).to eq(0)
      end
    end

    
  end

  describe "#arePostLikedBy" do

    subject {Like.arePostLikedBy post_id, user_id}
    let (:post_id) { 3 }

    context "user are liked post" do

      let (:user_id) { 1 }
      let (:res) { true }

      it {is_expected.to eq res}
    end

    context "user don't liked post" do

      let (:user_id) { 3 }
      let (:res) { false }

      it {is_expected.to eq res}
    end

    context "user or post don't exist" do

      let (:res) { false }
      
      let (:user_id) { 200 }

      it  {is_expected.to eq res}

      let (:user_id) { 1 }
      let (:post_id) { 200 }

      it {is_expected.to eq res}
    end
  end

  describe "#like" do

    subject{ Like.like post_id, user_id}

    context "user like post" do
      let (:user_id) { 1 }
      let (:post_id) { 4 }
      let (:res) { true }

      it "user first time like post" do
        expect(subject).to eq res
      end

      it "user second time like post" do
        Like.like post_id, user_id
        expect(subject).not_to eq res
      end
    end

    context "user or post don't exist" do

      let (:user_id) { 200 }
      it "user don't exist" do
        expect{subject}.to raise_error
      end

      let (:post_id) { 200 }
      let (:user_id) { 1 }
      it "post don't exist" do
        expect{subject}.to raise_error
      end
    end
  end

  describe "#dislike" do

    subject{ Like.dislike post_id, user_id}

    let (:post_id) { 3 }
    let (:user_id) { 1 }
    let (:res) { 1 }

    context "user dislike post" do

      it "user first time dislike post" do
        expect(subject).to eq res
      end

      it "user second time dislike post" do
        Like.dislike post_id, user_id
        expect(subject).to eq 0
      end

      it "do some likes and one dislike" do
        Like.like post_id, user_id
        Like.like post_id, user_id
        expect(subject).to eq res
      end
    end

    context "user or post don't exist" do

      let (:user_id) { 200 }
      
      it "user don't exist" do
        expect(subject).to eq 0
      end

      let (:post_id) { 200 }
      let (:user_id) { 1 }

      it "post don't exist" do
        expect(subject).to eq 0
      end
    end
  end

end
