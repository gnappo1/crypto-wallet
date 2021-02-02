class Transaction < ActiveRecord::Base
    belongs_to :sender_wallet, class_name: "Wallet"
    belongs_to :receiver_wallet, class_name: "Wallet"
end
