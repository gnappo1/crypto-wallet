class Coin < ActiveRecord::Base
    has_many :coinwallets
    has_many :wallets, through: :coinwallets
end
