class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    def print_review
         review = "#{self.user.name} gave #{self.product.name} a rating of #{self.rating} and said #{self.comment}"
    end

    
end