class PostsController < ApplicationController
    autocomplete :tag, :name,  :class_name => 'ActsAsTaggableOn::Tag' 


  def new
    @post = Post.new
    @uploader = Post.new.photo

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
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:idea])
        format.html { redirect_to @post, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
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


#   # GET /posts.json
#   def index
#     @post = Post.all
#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @posts }
#     end
#   end

#   # GET /posts/1
#   # GET /posts/1.json
  

#   # GET /ideas/new
#   # GET /ideas/new.json
#   def new
#     @post = Post.new

#     if user_signed_in?
#       respond_to do |format|
#         format.html # new.html.erb
#         format.json { render json: @post }
#       end
#     else 
#       flash[:alert] = 'You need to be logged in!'

#       redirect_to '/users/sign_up'
#     end
#   end

#   # GET /posts/1/edit
#   def edit
#     @post= Post.find(params[:id])
#   end

#   # POST /posts
#   # POST /posts.json
#   def create
#     Post.create(params[:post])

#     respond_to do |format|
#       if @post.save
#         format.html { redirect_to @post, notice: 'Post was successfully created.' }
#         format.json { render json: @post, status: :created, location: @post }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PUT /posts/1
#   # PUT /posts/1.json
#   def update
#     @post = Post.find(params[:id])

#     respond_to do |format|
#       if @post.update_attributes(params[:post])
#         format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /posts/1
#   # DELETE /posts/1.json
  # def destroy
  #   @post = Post.find(params[:id])
  #   @post.destroy

  #   respond_to do |format|
  #     format.html { redirect_to dashboard_url }
  #     format.json { head :no_content }
  #   end
#   end
end