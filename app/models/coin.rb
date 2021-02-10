class Coin < ActiveRecord::Base
    mount_uploader :avatar, AvatarUploader
    has_many :coinwallets
    has_many :wallets, through: :coinwallets
    validates :name, presence: true, uniqueness: true
    validates :value, numericality: {greater_than_or_equal_to: 0} #, allow_nil: true
end
