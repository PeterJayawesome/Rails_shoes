class User < ActiveRecord::Base
	has_many :buy_shoes, foreign_key: "buyer_id",class_name: "Shoe"
	has_many :sell_shoes, foreign_key: "seller_id",class_name: "Shoe"
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence:true, length:{minimum:2}
	validates :email, presence:true, format:{with:EMAIL_REGEX},uniqueness:true
	validates :password, presence:true, length:{minimum:8}
	has_secure_password
end
