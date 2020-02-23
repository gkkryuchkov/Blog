class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :permissions
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @articles = @articles.where('hidden = 0') unless current_user.try(:admin?)
    @articles = @articles.where('section_id = ?',params[:section]) if params[:section].present? && params[:section]!=''
    @articles = @articles.ordering.page(params[:page])
  end

  # GET /articles/1
  # GET /articles/1.json
  def show;end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.publish_date = Time.now
    @article.user_profile = current_user.user_profile
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image
    # delete a document, attached to key
    @images = ActiveStorage::Attachment.find(params[:id])
    @images.purge_later
    redirect_back(fallback_location: request.referer)
  end

  def deliver_image
    # returns a link to a file, attached to key
    attachment = ActiveStorage::Attachment.find(params[:id])
    file = attachment.blob
    send_file(ActiveStorage::Blob.service.send(:path_for, file.key),
              type: file.content_type, filename: file.filename,
              disposition: 'inline', key_id: attachment.record_id)
  end

  def add_to_favorite
    user_profile = User.find(params['user_id']).user_profile
    Article.find(params['article_id']).favorite_users << user_profile
  end

  def remove_from_favorite
    user_profile = User.find(params['user_id']).user_profile
    Article.find(params['article_id']).favorite_users.delete(user_profile)
  end

  private

    def permissions
      # authorization
      unless [:index, :show].include?(action_name.to_sym)
        render_error unless current_user.try(:admin?)
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article)
          .permit(:title, :description, :body,
                        :section_id,:user_profile_id, :hidden, images: [])
    end
end
