class Coinwallet < ActiveRecord::Base
    belongs_to :coin
    belongs_to :wallet
    validates :coin, presence: true
    validates :wallet, presence: true
    validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0}
end
