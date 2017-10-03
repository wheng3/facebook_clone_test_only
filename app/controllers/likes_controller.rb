class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def index
    @likes = Like.all
  end
  # POST /likes
  def create
    @status = Status.find(like_params[:status])
    if Like.find_by(user_id: like_params[:user], status_id: @status.id)
      flash[:alert] = 'You liked before!'
      redirect_to root_path
    else
      @like = Like.new(user_id: like_params[:user], status_id: @status.id)
      @like.save
      redirect_to root_path, notice: "You liked #{@status.title}!"
    end
  end

  # DELETE /likes/1
  def destroy
    @status = @like.status
    @like.destroy
    redirect_to @status, notice: 'You unlike.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def like_params
      params.require(:like).permit(:status, :user)
    end
end