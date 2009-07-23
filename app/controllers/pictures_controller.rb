class PicturesController < ApplicationController
  before_filter :find_product
  layout 'products'
  
  
  def index
    @pictures = @product.picture.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pictures }
    end
  end
  
  def create
    @picture = Picture.new(:uploaded_data => params[:picture_file])
    @service = ProductService.new(@product, @picture)
    
    
    respond_to do |format|
      if @service.save
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to product_pictures_path(@product)}
        format.xml  { head :ok }
      else
        flash[:notice] = 'The image could not be saved.'
        format.html { redirect_to product_pictures_path(@product) }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @picture = Picture.find(params[:id])
    
    respond_to do |format|
      if @picture.destroy
        flash[:notice] = "Picture Deleted"
        format.html { redirect_to(product_pictures_url(@product)) }
        format.xml  { head :ok }
      else
        flash[:notice] = "You can't delete the last picture"
        format.html { redirect_to(product_pictures_url(@product)) }
        format.xml  { head :ok }
      end
    end
  end




protected
  def find_product
    @product = Product.find(params[:product_id])
  end
  
  
end
