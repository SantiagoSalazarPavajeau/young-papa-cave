class User < ApplicationRecord
    has_many :projects
    has_many :hobbies, through: :projects
    has_secure_password
    validates :username, uniqueness: true
    validates :password, length: {minimum: 7}

    def self.most_active
        where("id = #{Project.count_by_user.sort_by{|k,v| [-v, k]}.first.first}")
    end



    

    # before_create :email_user_about_signup

    # private

    # def email_user_about_signup
    #     UserMailer.with(user: @user).welcome_email.deliver_later
    # end
end
