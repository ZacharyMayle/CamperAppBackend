class User < ApplicationRecord
    has_many :user_campgrounds
    has_many :campgrounds, through: :user_campgrounds
end
