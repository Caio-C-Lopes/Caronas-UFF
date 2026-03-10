class CampiController < ApplicationController
  #destroy carona ability gem can can can
  before_action :set_campus, only: [:show, :edit, :update, :destroy, :deactivate, :activate ]

  # GET /campi or /campi.json
  def index
    @campi = Campus.finder(params[:q]).page(params[:page])
  end 

  # GET /campi/1 or /campi/1.json
  def show
  end

  # GET /campi/new
  def new
    @campus = Campus.new
  end

  # GET /campi/1/edit
  def edit
  end
  
  def search
    render json: Campus.finder(params[:q])
  end

  def deactivate
    if @campus.set_deactivate_date
      redirect_to campi_path(page: params[:page]), notice: "Campus #{@campus.title} desativado!"
    else
      redirect_to campi_path(page: params[:page]), alert: "Existe uma carona utilizando esse Campus!"
    end
  end

  def activate
    @campus.set_activate_date
    redirect_to campi_path(page: params[:page]), notice: "Campus #{@campus.title} ativado!"
  end

  # POST /campi or /campi.json
  def create
    @campus = Campus.new(campus_params)

    respond_to do |format|
      if @campus.save
        format.html { redirect_to @campus, notice: "Campus #{@campus.title} was successfully created." }
        format.json { render :show, status: :created, location: @campus }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campi/1 or /campi/1.json
  def update
    respond_to do |format|
      if @campus.update(campus_params)
        format.html { redirect_to @campus, notice: "Campus #{@campus.title} was successfully updated." }
        format.json { render :show, status: :ok, location: @campus }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campi/1 or /campi/1.json
  def destroy
    @campus = Campus.find(params[:id])
    
    current_page = params[:page].to_i
    campi = Campus.all.page(current_page).per(3)

    redirect_page = RedirectPageService.new(campi, current_page)
    page_direct = redirect_page.call

    if @campus.can_delete?
      @campus.destroy
      notice = "Campus #{@campus.title} foi excluído."
    else
      notice = nil
      alert = "Existe uma carona utilizando esse Campus!"
    end

    respond_to do |format|
      format.html { redirect_to campi_path(page: page_direct), status: :see_other, notice: notice, alert: alert }
      format.json { head :no_content }
    end     
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campus
      @campus = Campus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campus_params
      params.require(:campus).permit(:title, :address, :number, :neighborhood, :city, :cep, :deactivation_date)
    end
end
