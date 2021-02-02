class Wallet < ActiveRecord::Base
    belongs_to :owner, class_name: "User"
    has_many :initiated_transactions, class_name: "Transaction", foreign_key: "sender_wallet_id"
    has_many :received_transactions, class_name: "Transaction", foreign_key: "receiver_wallet_id"
    has_many :coinwallets
    has_many :coins, through: :coinwallets
    has_secure_password
end
