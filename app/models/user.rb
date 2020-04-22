class User < ApplicationRecord
    has_many :projects
    has_many :hobbies, through: :projects
    has_secure_password
    validates :username, uniqueness: true
    validates :password, length: {minimum: 7}

    def self.most_active
        order(projects_count: :desc).limit(3)
        #where("id = #{Project.count_by_user.sort_by{|k,v| [-v, k]}.first.first}") # descending project count[ [1,2][2,1]]
    end

    # top 3
    # counter cache

    

    # before_create :email_user_about_signup

    # private

    # def email_user_about_signup
    #     UserMailer.with(user: @user).welcome_email.deliver_later
    # end
end
