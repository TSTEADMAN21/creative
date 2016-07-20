class EmailinfosController < ApplicationController
  before_action :set_emailinfo, only: [:show, :edit, :update, :destroy]

  # GET /emailinfos
  # GET /emailinfos.json
  def index
    @emailinfos = Emailinfo.all
  end

  # GET /emailinfos/1
  # GET /emailinfos/1.json
  def show
  end

  # GET /emailinfos/new
  def new
    @emailinfo = Emailinfo.new
  end

  # GET /emailinfos/1/edit
  def edit
  end

  # POST /emailinfos
  # POST /emailinfos.json
  def create
    @emailinfo = Emailinfo.new(emailinfo_params)

    respond_to do |format|
      if @emailinfo.save
        format.html { redirect_to @emailinfo, notice: 'Emailinfo was successfully created.' }
        format.json { render :show, status: :created, location: @emailinfo }
      else
        format.html { render :new }
        format.json { render json: @emailinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emailinfos/1
  # PATCH/PUT /emailinfos/1.json
  def update
    respond_to do |format|
      if @emailinfo.update(emailinfo_params)
        format.html { redirect_to @emailinfo, notice: 'Emailinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @emailinfo }
      else
        format.html { render :edit }
        format.json { render json: @emailinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emailinfos/1
  # DELETE /emailinfos/1.json
  def destroy
    @emailinfo.destroy
    respond_to do |format|
      format.html { redirect_to emailinfos_url, notice: 'Emailinfo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emailinfo
      @emailinfo = Emailinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emailinfo_params
      params.require(:emailinfo).permit(:email_id)
    end
end
