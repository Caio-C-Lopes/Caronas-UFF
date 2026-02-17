class CaronasController < ApplicationController
  before_action :set_carona, only: %i[ show edit update destroy ]

  # GET /caronas or /caronas.json
  def index
    @q = Carona.ransack(params[:q])
    @caronas = @q.result(distinct: true).order(date_time: :desc).page(params[:page]).per(6)
  end
 
  # GET /caronas/1 or /caronas/1.json
  def show
  end

  # GET /caronas/new
  def new
    @carona = Carona.new
  end

  # GET /caronas/1/edit
  def edit
  end

  # POST /caronas or /caronas.json
  def create
    @carona = Carona.new(carona_params)

    respond_to do |format|
      if @carona.save
        format.html { redirect_to @carona, notice: "Carona criada com sucesso." }
        format.json { render :show, status: :created, location: @carona }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @carona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caronas/1 or /caronas/1.json
  def update
    page = params[:page]

    respond_to do |format|
      if @carona.update(carona_params)
        format.html { redirect_to caronas_path(page: page), notice: "Carona atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @carona }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @carona.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # DELETE /caronas/1 or /caronas/1.json
  def destroy
    destroyed = @carona.destroy
    
    current_page = params[:page].to_i
    caronas = Carona.all.page(current_page).per(3)

    redirect_page = RedirectPageService.new(caronas, current_page)
    page_direct = redirect_page.call
    
    respond_to do |format|
      if destroyed
        format.html { redirect_to caronas_path(page: page_direct), status: :see_other, notice: "Carona de #{@carona.driver_name} foi excluída." }
        format.json { head :no_content }
      else
        format.html { redirect_to caronas_path(page: page_direct), status: :see_other, alert: "Erro ao deletar a Carona de #{@carona.driver_name}." }
        format.json { head :no_content }
      end
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carona
      @carona = Carona.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carona_params
      params.require(:carona).permit(:driver_name, :departure, :destination, :date_time, :passengers_number, :cost, :obs,
        carona_paradas_attributes: [:id, :parada_id, :_destroy, parada_attributes: [:id, :title, :_destroy]])
    end

end