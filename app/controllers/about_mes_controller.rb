class AboutMesController < ApplicationController
  before_action :set_about_mes, only: [:show, :edit, :update, :destroy]
  # GET /about_mess
  # GET /about_mess.json
  def index
    @about_mes = if AboutMes.first
      AboutMes.first
    else 
      AboutMes.new.save!
      AboutMes.first
    end

  end

  # GET /about_mess/1
  # GET /about_mess/1.json
  def show;
    redirect_to about_mes_path
  end

  # GET /about_mess/new
  def new
    @about_mes = AboutMes.new
  end

  # GET /about_mess/1/edit
  def edit
  end

  # POST /about_mess
  # POST /about_mess.json
  def create
    @about_mes = AboutMes.new().save!

    # respond_to do |format|
    #   if @about_mes.save
    #     format.html { redirect_to @about_mes, notice: 'About me was successfully created.' }
    #     format.json { render :show, status: :created, location: @about_mes }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @about_mes.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /about_mess/1
  # PATCH/PUT /about_mess/1.json
  def update
    respond_to do |format|
      if @about_mes.update(about_mes_params)
        format.html { redirect_to @about_mes, notice: 'About me was successfully updated.' }
        format.json { render :show, status: :ok, location: @about_mes }
      else
        format.html { render :edit }
        format.json { render json: @about_mes.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /about_mess/1
  # DELETE /about_mess/1.json
  def destroy
    @about_mes.destroy
    respond_to do |format|
      format.html { redirect_to about_mess_url, notice: 'About me was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_mes
      @about_mes = AboutMes.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_mes_params
      params.fetch(:about_mes, {}).permit(:body)
    end

end
