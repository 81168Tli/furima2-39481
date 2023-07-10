class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :state
  belongs_to :deriver_day
  belongs_to :prefecture
  belongs_to :deriver_cost


validates :name, presence: true
validates :content, presence: true
validates :price, presence: true,numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999,only_integer: true }
validates :image, presence: true

validates :genre_id,:state_id,:deriver_day_id,:prefecture_id,:deriver_cost_id, numericality: { other_than: 1 , message: "can't be blank"}



end
