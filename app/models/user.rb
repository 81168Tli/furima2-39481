class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :lastname1, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :firstname1, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :lastname2, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :firstname2, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birth, presence: true


end
