class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :lastname1, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :firstname1, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :lastname2, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :firstname2, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birth, presence: true

         validate :password_complexity
         has_many :items
         #has_many :orders
       
         private
       
         def password_complexity
           return if password.blank? || password.match?(/\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+\z/)
           errors.add(:password, "must include at least one letter and one digit")
         end


end
