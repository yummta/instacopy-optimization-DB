module Followable
  extend ActiveSupport::Concern

  included do
    has_many :followed_relations, class_name: 'Follow',
                                foreign_key: 'follower_id',
                                dependent: :destroy
    has_many :follower_relations, class_name: 'Follow',
                                  foreign_key: 'followed_id',
                                  dependent: :destroy
    has_many :following, through: :followed_relations, source: :followed
    has_many :followers, through: :follower_relations, source: :follower
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end
end