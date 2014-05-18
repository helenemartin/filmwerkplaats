class PostsController < ApplicationController
    autocomplete :tag, :name,  :class_name => 'ActsAsTaggableOn::Tag' 


  def new
    @post = Post.new


  end

  # def show
  #   @post= Post.find(params[:id])
  # end
  def show
    @post = Post.find(params[:id])
    # authorize! :read, @article

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

   before_action :authenticate_user!, except: [:index]

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.photo = params[:post][:photo]
      @post.video = params[:post][:video]
      @post.save

      redirect_to @post
    else
      render :new
    end
  end

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :url, :medium, :tag_list)
  end

end