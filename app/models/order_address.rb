class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :s_num, :build_name, :tel, :user_id, :item_id
   attr_accessor :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :s_num
    validates :post_code, format:  { with: /\A\d{3}-\d{4}\z/, allow_blank: true }
    validates :tel, length: { in: 10..11,allow_blank: true }, numericality: { only_integer: true,allow_blank: true }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, s_num: s_num, build_name: build_name, tel: tel, order_id: order.id)
  end

end