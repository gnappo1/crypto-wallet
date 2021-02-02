class Coinwallet < ActiveRecord::Base
    belongs_to :coin
    belongs_to :wallet
end
