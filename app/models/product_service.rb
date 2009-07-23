class ProductService
  attr_reader :product, :picture
  
  def initialize(product, picture)
    @product = product
    @picture = picture
  end

  def save
    return false unless valid?
    begin
      Product.transaction do
        if @picture.new_record?
          @product.picture.destroy if @product.picture
          @picture.product = @product
          @picture.save!
        end
        @product.save!
        true
      end
    rescue
      false
    end
  end
  
  def update_attributes(product_attributes, picture_file)
    @product.attributes = product_attributes
    unless picture_file.blank?
      @picture = Picture.new(:uploaded_data => picture_file)
    end
    save
  end
  
  
  
  
  def valid?
    @product.valid? && @picture.valid?
  end


end