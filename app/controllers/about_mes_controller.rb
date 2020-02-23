class AboutMesController < ApplicationController
  before_action :set_about_me, only: [:show, :edit, :update, :destroy]

  # GET /about_mes
  # GET /about_mes.json
  def index
    @about_me = AboutMe.first
  end

  # GET /about_mes/1
  # GET /about_mes/1.json
  def show
    redirect_to about_mes_path
  end

  # GET /about_mes/new
  def new
    @about_me = AboutMe.new
  end

  # GET /about_mes/1/edit
  def edit
  end

  # POST /about_mes
  # POST /about_mes.json
  def create
    @about_me = AboutMe.new(about_me_params)

    respond_to do |format|
      if @about_me.save
        format.html { redirect_to @about_me, notice: 'About me was successfully created.' }
        format.json { render :show, status: :created, location: @about_me }
      else
        format.html { render :new }
        format.json { render json: @about_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /about_mes/1
  # PATCH/PUT /about_mes/1.json
  def update
    respond_to do |format|
      if @about_me.update(about_me_params)
        format.html { redirect_to @about_me, notice: 'About me was successfully updated.' }
        format.json { render :show, status: :ok, location: @about_me }
      else
        format.html { render :edit }
        format.json { render json: @about_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /about_mes/1
  # DELETE /about_mes/1.json
  def destroy
    @about_me.destroy
    respond_to do |format|
      format.html { redirect_to about_mes_url, notice: 'About me was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_me
      @about_me = AboutMe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_me_params
      params.fetch(:about_me, {})
    end
end
