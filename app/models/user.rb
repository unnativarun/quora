class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :answers
  has_and_belongs_to_many :following, join_table: "followings_users", foreign_key: "following_id", class_name: "User", source: :user
  has_and_belongs_to_many :topics

end
