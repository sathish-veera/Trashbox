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
    @items = Item.all
  end

  # POST /trash_requests
  # POST /trash_requests.json
  def create
    trash_request = TrashRequest.create_record(trash_request_params)
    respond_to do |format|
      if trash_request
        format.html { redirect_to trash_request, notice: 'Trash request was successfully created.' }
        format.json { render :show, status: :created, location: trash_request }
      else
        format.html { render :new }
        format.json { render json: @trash_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trash_requests/1
  # PATCH/PUT /trash_requests/1.json
  def update
    trash_request = TrashRequest.update_record(trash_request_params,params[:id])
    respond_to do |format|
      if trash_request
        format.html { redirect_to trash_request, notice: 'Trash request was successfully updated.' }
        format.json { render :show, status: :ok, location: trash_request }
      else
        format.html { render :edit }
        format.json { render json:  trash_request.errors, status: :unprocessable_entity }
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
      params.require(:trash_request).permit(:trash_request_date,:trash_request_items => [:is_checked,:rough_unit,:rough_amount])
    end
end
