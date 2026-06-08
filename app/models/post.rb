class Post < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: "User", optional: true
end
