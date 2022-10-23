class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments
  def index
    @comments = Comment.all
  end
  
  # GET /comments/:id
  def show
  end

  # GET /comments/new  
  def new
    @comment = Comment.new
  end

  # GET /articles/:id/edit
  def edit
    
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = params[:article_id]
    if @comment.save
      redirect_to article_url(@comment.article), notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/:id
  def update
    if @comment.update(comment_params)
      redirect_to article_url(@comment.article), notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment.destroy
    redirect_to article_url(@comment.article), notice: "Comment was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find_by(article_id: params[:article_id], id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end


