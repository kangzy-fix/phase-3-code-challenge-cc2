class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def leave_review(user:, rating:, comments:) new_review = Review.create(rating: rating, comment: comment)
    self.reviews << new_review
    user.reviews << new_review   end

  def print_all_reviews
    self.reviews.map { |review| review.print_review }
  end

  def average_rating
    self.reviews.map { |review| review.rating }.sum.to_f / self.reviews.length.to_f
  end
end
