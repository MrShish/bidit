class Picture < ActiveRecord::Base
  belongs_to :product
  before_destroy :check_some_pictures_remain_for_product
 
  
  has_attachment  :content_type => :image,
                  :storage => :file_system,
                  :processor => 'mini_magick',
                  :max_size => 500.kilobytes,
                  :resize_to => '384x256>',
                  :thumbnails => {
                    :large => '96x96>',
                    :medium => '64x64>',
                    :small => '48x48>'                    
                  }
  validates_as_attachment
 
  def check_some_pictures_remain_for_product
    Picture.count(:conditions => ["product_id = ? and id <> ?", self.product_id, self.id]) > 0  
  end
end