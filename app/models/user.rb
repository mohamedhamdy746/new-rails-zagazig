class User < ApplicationRecord
  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :created_posts, class_name: "Post", foreign_key: :creator_id, dependent: :nullify
end
