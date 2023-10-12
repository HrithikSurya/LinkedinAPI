class CompaniesController < ApplicationController
  # load_and_authorize_resource

  before_action :set_company, only: [:show, :update, :destroy]

  def index
    @companies = Company.all
    # can: read, @companies
    render json: @companies, status: :ok
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created
    else
      render json: { error: 'Company could not be created',status: :unprocessable_entity }
    end
  end

  def show
    if @company.present?
      render json: @company, status: :ok      
    else
      render json: { error: 'Company Not Found', status: :unprocessable_entity }
    end
  end

  def update
    if @company.present?
      render json: @companies, status: :ok
    else
      render json: { error: 'companies could not be updated', status: :unprocessable_entity }
    end
  end

  def destroy
    if @company.present?
      render json: @company, status: :ok
      @company.destroy
    else
      render json: { error: ' Company Not Found' }, status: 403
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:company_name, :sector, :location, :establishment)
  end

end
