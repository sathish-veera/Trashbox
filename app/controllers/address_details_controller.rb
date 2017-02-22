class AddressDetailsController < ApplicationController
	before_action :check_address_detail, only: :index
  def index
  	@profile = current_user.address_detail
  end

  def new
  	@profile = AddressDetail.new
  end

  def create
  	address_detail = current_user.build_address_detail(profiles_params)
    respond_to do |format|
      if address_detail.save
        format.html { redirect_to :address_details, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: address_detail }
      else
        format.html { render :new }
        format.json { render json: address_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  	@profile = AddressDetail.find_by_id(params[:id])
  end

  def update
  	address_detail = AddressDetail.find_by_id(params[:id])
  	address_detail.update(profiles_params)
  	redirect_to :address_details, notice: 'Profile was successfully updated.'
  end

  private

  def profiles_params
  	params.require(:address_detail).permit(:first_name,:last_name,:address_line1,:address_line2,:city,:land_line_no, :mobile_no,:state,:zip_code)
  end
end
