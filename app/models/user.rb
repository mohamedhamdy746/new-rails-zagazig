class User < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true

  validates :email,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: "is not a valid email"
            }
end
