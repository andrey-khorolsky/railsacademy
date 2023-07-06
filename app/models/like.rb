class Like < ApplicationRecord

    def self.findLikes(post_id)
        return self.where(post_id: post_id).count
    end

    def self.like post_id, user_id
        @like = Like.new(post_id: post_id, user_id: user_id)
        @like.save
    end

    def self.dislike post_id, user_id
        Like.delete_by(post_id: post_id, user_id: user_id)
    end
end
