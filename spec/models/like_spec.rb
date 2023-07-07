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

    context "user are liked post" do

      let (:post_id) { 3 }
      let (:user_id) { 1 }
      let (:res) { true }

      it {is_expected.to eq res}
    end
  end

end
