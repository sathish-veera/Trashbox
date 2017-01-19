class TrashRequestsController < ApplicationController
  before_action :set_trash_request, only: [:show, :edit, :update, :destroy]

  # GET /trash_requests
  # GET /trash_requests.json
  def index
    @trash_requests = TrashRequest.all
  end

  # GET /trash_requests/1
  # GET /trash_requests/1.json
  def show
  end

  # GET /trash_requests/new
  def new
    @trash_request = TrashRequest.new
    @items = Item.all
  end

  # GET /trash_requests/1/edit
  def edit
  end

  # POST /trash_requests
  # POST /trash_requests.json
  def create
    @trash_request = TrashRequest.new(trash_request_params)

    respond_to do |format|
      if @trash_request.save
        format.html { redirect_to @trash_request, notice: 'Trash request was successfully created.' }
        format.json { render :show, status: :created, location: @trash_request }
      else
        format.html { render :new }
        format.json { render json: @trash_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trash_requests/1
  # PATCH/PUT /trash_requests/1.json
  def update
    respond_to do |format|
      if @trash_request.update(trash_request_params)
        format.html { redirect_to @trash_request, notice: 'Trash request was successfully updated.' }
        format.json { render :show, status: :ok, location: @trash_request }
      else
        format.html { render :edit }
        format.json { render json: @trash_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trash_requests/1
  # DELETE /trash_requests/1.json
  def destroy
    @trash_request.destroy
    respond_to do |format|
      format.html { redirect_to trash_requests_url, notice: 'Trash request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trash_request
      @trash_request = TrashRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trash_request_params
      params.require(:trash_request).permit(:tr_serial_no, :request_status, :trash_request_date, :request_generate_date, :total_amount)
    end
end
