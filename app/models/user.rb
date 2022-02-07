class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }

  has_many :tweets
  has_many :comments

  enum gender: { gender_private: 0, male: 1, female: 2 }
  enum age: { age_private: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, over_sixties: 6 }
end
