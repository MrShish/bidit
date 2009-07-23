class Product < ActiveRecord::Base
  has_many :picture, :dependent => :destroy
  
  validates_presence_of :title,  :description
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  validates_uniqueness_of :title
 
  protected
  def price_must_be_at_least_a_cent
    errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
  end
  
  
  
end
