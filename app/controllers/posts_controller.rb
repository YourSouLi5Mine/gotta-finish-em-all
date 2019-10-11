class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :accept]
  before_action :set_posts, only: [:index, :export]

  # GET /posts
  # GET /posts.json
  def index
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.users.push(User.find(current_user.id))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if update_service
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    Facebook.publish(current_user.page_token, @post.content, image_key)
    flash[:success] = "Post with id: #{@post.id} was successfully created in FB!"
    redirect_to root_url
  end

  def export
    respond_to do |format|
      format.pdf do
        render pdf: "Facebook Publications #{Time.now.strftime('%d-%m-%Y')}",
          template: 'pdfs/export.html.haml',
          layout: 'pdf',
          page_size: 'A4',
          lowquality: true,
          orientation: 'Landscape'
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_posts
    @posts = Post.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content, :image, :user_id)
  end

  def update_service
    Post.transaction do
      @post.update!(post_params)

      post_user_service(@post.content_creator_id) if current_user.is_content_creator?
      post_user_service(@post.designer_id) if current_user.is_designer?
    end
    true
  end

  def post_user(old_user_id)
    @post.post_users.where(user_id: old_user_id)
  end

  def post_user_service(record)
    if record.present?
      record.first.update_attributes(user_id: current_user.id)
    else
      @post.users.push(User.find(current_user.id))
    end
  end

  def image_key
    @post.image.key if @post.image.attached?
  end
end
