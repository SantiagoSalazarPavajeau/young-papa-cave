class User < ApplicationRecord
    has_many :projects
    has_many :hobbies, through: :projects

    before_save :email_user_about_signup

    private

    def email_user_about_signup

    end
end
