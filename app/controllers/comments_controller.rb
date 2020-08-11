class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :clear_content, :rating_up, :rating_down]
  before_action :find_commentable, only: :create
  # GET /comments
  # GET /comments.json
  # def index
  #   @comments = Comment.all
  # end

  # GET /comments/1
  # GET /comments/1.json
  # def show
  # end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    comment = Comment.create(comment_params)
    comment.user_profile = current_user.user_profile
    # @commentable.comments.build(comment_params)
    @commentable.comments << comment
    article = find_article(@commentable)
    if @commentable.is_a? Comment
      Notification.create!(
        article_id: article.id,
        comment_id: @commentable.id,
        user_profile_id:  current_user.user_profile.id,
        seen: 0,
        text: "#{current_user.user_profile.username.capitalize} left the answer for your comment"
      )
    end
    redirect_to article
    # redirect_back(fallback_location: fallback_location)
    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
    #     format.json { render :show, status: :created, location: @comment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        @comment.edited = 1
        @comment.save!
        # raise @comment.inspect
        format.html { article = find_article(@comment)
                      redirect_to article}
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  #
  def clear_content
    @comment.content = I18n.t('comments.deleted_content')
    @comment.deleted = 1
    @comment.save!
    respond_to do |format|
      format.html {redirect_to find_article(@comment)}

    end
  end

  def destroy
    article = find_article(@comment)
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rating_up
    if params[:curr_rating].to_i == 0
      # raise @comment.inspect
      @comment.rating += 1

      u_c_rating = UsrComRating.create(
          comment_id: @comment.id,
          user_profile_id: current_user.user_profile.id,
          rating: 1)
      @comment.usr_com_ratings << u_c_rating
      # raise @comment.usr_com_ratings.inspect
      article_id = find_article(@comment).id
      Notification.create!(
        article_id: article_id,
        comment_id: @comment.id,
        user_profile_id:  current_user.user_profile.id,
        seen: 0,
        text: "#{current_user.user_profile.username.capitalize} rated up your comment"
      )

      @comment.save!

    elsif params[:curr_rating].to_i == -1
      @comment.rating += 1
      u_c_rating = UsrComRating.find_by(
          comment_id: @comment.id,
          user_profile_id: current_user.user_profile.id)
      @comment.usr_com_ratings.delete(u_c_rating)
      u_c_rating.destroy!
      @comment.save!
    end
    redirect_to find_article(@comment)
  end

  def rating_down
    if params[:curr_rating].to_i == 0
      @comment.rating -= 1
      u_c_rating = UsrComRating.create(
          comment_id: @comment.id,
          user_profile_id: current_user.user_profile.id,
          rating: -1)
      @comment.usr_com_ratings << u_c_rating
      @comment.save!
    elsif params[:curr_rating].to_i == 1
      @comment.rating -= 1
      u_c_rating = UsrComRating.find_by(
          comment_id: @comment.id,
          user_profile_id: current_user.user_profile.id)
      @comment.usr_com_ratings.delete(u_c_rating)
      u_c_rating.destroy!
      @comment.save!
    end
    redirect_to find_article(@comment)
  end

  private

  def permissions
    if [:create, :new].include?(action_name.to_sym) && !current_user
      render_error("You can not create comments until you sign in")
    end
    if [:destroy, :update, :edit].include?(action_name.to_sym)
      if !current_user
        render_error("You could not change comments until you sign in")
      else
        unless comment.user_profile == current_user.user_profile || current_user.try(:admin?)
          render_error('This is not your comment')
        end
      end
    end
  end
  # Use callbacks to share common setup or constraints between actions.
  def find_article(commentable)
    if commentable.is_a? Comment
      find_article(commentable.commentable)
    else
      commentable
    end
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:rating, :content, :edited, :deleted)
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    elsif params[:article_id]
      @commentable = Article.find(params[:article_id])
    end
  end
end
