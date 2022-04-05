class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @board = Board.find_by(id: params[:board_id])
    @comment = Comment.find_by(id: params[:id])
end


  # POST /boards or /boards.json
  def create
    @board = Board.find_by(id: params[:board_id])
    @comment = @board.comments.build(comment_params)
    if @comment.save
        @comment = Comment.new
        @comments = @board.comments.order('created_at DESC')
    end
end


  # PATCH/PUT /boards/1 or /boards/1.json
  def update
    @board = Board.find_by(id: params[:board_id])
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
        @comments = @board.comments.order('created_at DESC')
    end
  end

  # DELETE /boards/1 or /boards/1.json
  def destroy
    @board = Board.find_by(id: params[:board_id])
    @comment = Comment.find_by(id: params[:id])
    if @comment.destroy
        @comments = @board.comments.order('created_at DESC')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
