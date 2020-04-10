class Project < ApplicationRecord
    belongs_to :user
    belongs_to :hobby
    validates :title, presence: true
    validates :description, presence: true, length: {minimum: 25}

   

    def hobby_title=(title)
        self.hobby = Hobby.find_or_create_by(title: title)
    end

    def hobby_title
        self.hobby ? self.hobby.title : nil
    end

    # validate :is_title_case
    # before_validation :make_title_case
 
    # private
    # def is_title_case
    #     if title.split.any?{|w|w[0].upcase != w[0]}
    #     errors.add(:title, "Title must be in title case")
    #     end
    # end
    
    # def make_title_case
    #     # Rails provides a String#titlecase method
    #     self.title = self.title.titlecase
    # end
end
