# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def picture_for(picture, size = :medium)
    if picture
      picture_image = picture.public_filename(size)
      link_to image_tag(picture_image), picture.public_filename
    else
      image_tag("blank-cover-#{size}.png")
    end
  end
  
end
