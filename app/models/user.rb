class User < ActiveRecord::Base #500+
    has_many :wallets, class_name: "Wallet", foreign_key: "owner_id"
    has_many :coins, through: :wallets
    has_secure_password #password, passeord=, authenticate, password_confirmation, password_confirmation=
    validates :password, length: {in: 10..100}, confirmation: true
    validates :username, uniqueness: true, length: {in: 5..30}, exclusion: {in: %w(admin superadmin user)}
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
end
