class Transaction < ActiveRecord::Base
    belongs_to :sender_wallet, class_name: "Wallet"
    belongs_to :receiver_wallet, class_name: "Wallet"
    validates :amount, presence: true, numericality: {greater_than: 0}
    validate :in_the_future?
    validates :fee, presence: true
    validates :transaction_id, presence: true
    validates :category, presence: true, inclusion: {in: ["Send", "Receive", "Buy"], message: "Must be one of: Send, Receive, Buy."}
    validates :status, presence: true, inclusion: {in: ["Pending", "Complete", "Rejected"], message: "Must be one of: Pending, Complete, Rejected."}
    validates :sender_wallet, presence: true
    validates :receiver_wallet, presence: true

    def in_the_future?
        if self.timestamp > DateTime.now
            self.errors.add :timestamp, "cannot be in the future!!!"
        end
    end
end
