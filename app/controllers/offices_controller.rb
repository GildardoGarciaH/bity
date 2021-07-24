class OfficesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_office, only: %i[ show edit update destroy ]

  # GET /offices or /offices.json
  def index
    @offices = current_user.offices

    @data = Office.select('offices.id AS id_office, offices.name AS name_office, count(employees.office_id) AS count_employees')
            .joins('LEFT JOIN employees ON office_id = offices.id')
            .where('user_id=?', current_user.id)
            .group('offices.name')    
  end

  # GET /offices/1 or /offices/1.json
  def show
  end

  # GET /offices/new
  def new
    @office = Office.new
  end

  # GET /offices/1/edit
  def edit
    @employees = Employee.where("office_id=?", params[:id])
  end

  # POST /offices or /offices.json
  def create
    @office = current_user.offices.new(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to edit_office_path(@office.id), notice: "Office was successfully created." }
        format.json { render :show, status: :created, location: @office }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offices/1 or /offices/1.json
  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to edit_office_path(@office), notice: "Office was successfully updated." }
        format.json { render :show, status: :ok, location: @office }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1 or /offices/1.json
  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to offices_url, notice: "Office was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def office_params
      params.require(:office).permit(:name, :street, :ext_number, :int_number, :neighborhood, :postal_code, :city, :country, :user_id)
    end
end
