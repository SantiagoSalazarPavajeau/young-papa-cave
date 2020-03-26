class User < ApplicationRecord
    has_many :projects
    has_many :hobbies, through: :projects

    before_create :email_user_about_signup

    private

    def email_user_about_signup
        UserMailer.with(user: @user).welcome_email.deliver_later
    end
end
