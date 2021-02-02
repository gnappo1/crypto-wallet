class User < ActiveRecord::Base #500+
    has_secure_password #password, passeord=, authenticate, password_confirmation
    has_many :wallets, class_name: "Wallet", foreign_key: "owner_id"
    has_many :coins, through: :wallets
end
