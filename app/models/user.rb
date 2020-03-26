class User < ApplicationRecord
    has_many :projects
    has_many :hobbies, through: :projects
end
