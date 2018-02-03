class EmergenciaController < ApplicationController
  before_action :set_emergencium, only: [:show, :edit, :update, :destroy]

  # GET /emergencia
  # GET /emergencia.json
  def index
    @emergencia = Emergencium.all
    @hash = Gmaps4rails.build_markers(@emergencia) do |emergencia, marker|
  marker.lat emergencia.latitude
  marker.lng emergencia.longitude
  marker.infowindow emergencia.descrption
  marker.picture({
    "url" => 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
    "height" => 32,
    "width" => 32
  })
  marker.json({title: emergencia.title})
end

  end

  # GET /emergencia/1
  # GET /emergencia/1.json
  def show
  end

  # GET /emergencia/new
  def new
    @emergencium = Emergencium.new
  end

  # GET /emergencia/1/edit
  def edit
  end

  # POST /emergencia
  # POST /emergencia.json
  def create
    @emergencium = Emergencium.new(emergencium_params)

    respond_to do |format|
      if @emergencium.save
        format.html { redirect_to @emergencium, notice: 'Emergencium was successfully created.' }
        format.json { render :show, status: :created, location: @emergencium }
      else
        format.html { render :new }
        format.json { render json: @emergencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergencia/1
  # PATCH/PUT /emergencia/1.json
  def update
    respond_to do |format|
      if @emergencium.update(emergencium_params)
        format.html { redirect_to @emergencium, notice: 'Emergencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @emergencium }
      else
        format.html { render :edit }
        format.json { render json: @emergencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergencia/1
  # DELETE /emergencia/1.json
  def destroy
    @emergencium.destroy
    respond_to do |format|
      format.html { redirect_to emergencia_url, notice: 'Emergencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergencium
      @emergencium = Emergencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergencium_params
      params.require(:emergencium).permit(:latitude, :longitude, :address, :descrption, :title)
    end
end
