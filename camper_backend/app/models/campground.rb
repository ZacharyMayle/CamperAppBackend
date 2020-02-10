class Campground < ApplicationRecord
    has_many :user_camprounds
    has_many :users, through: :user_camprounds
end
