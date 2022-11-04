class User < ActiveRecord::Base
  has_many :reviews
  has_many :products, through: :reviews

  def favorite_product
    highest_rating = self.reviews.map { |review| review.rating }.max
    product_id = self.reviews.map { |review| review.rating == highest_rating ? review.product_id : nil }.compact[0]
    self.products.filter { |product| product.id == product_id }
  end

  def remove_review(product:)
    self.reviews.map do |review|
      if review.product id == product.id
        review.destroy
      end
    end
  end
end
