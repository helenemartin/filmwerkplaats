class DashboardController < ApplicationController

  # GET /ideas
  # GET /ideas.json
  def index
    @posts = Post.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @post= Post.find(params[:id])
    # authorize! :read, @article

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post}
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @post = Post.new

    if user_signed_in?
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @post }
      end
    else 
      flash[:alert] = 'You need to be logged in!'

      redirect_to '/users/sign_up'
    end
  end

  # GET /ideas/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
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

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @post= Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end
end
