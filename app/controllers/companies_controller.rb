class CompaniesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :update, :destroy]

  def index
  params[:q].blank?  &&  (
    @companies = Company.page(params[:page]).per(4)
  ) || (
    @q = Company.ransack(params[:q])
    @companies = @q.result.page(params[:page]).per(4)
  )
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    if @company.save
      # render_company_serializer(@company)
      render 'create', status: 200
    else
      render json: @company.errors.full_messages, status: 422
    end
  end

  def show; end

  def update
    if @company.update(company_params)
      # render_company_serializer(@company)
      render 'update', status: 200
    else
      render 'update', status: 422
    end
  end

  def destroy
    if @company
      if @company.destroy
        render 'destroy', status: 200
      else 
        render 'destroy', status: 422
      end
    else
      render 'destroy', status: 404
    end
  end

  private

  def render_company_serializer(company)
    render json: CompanySerializer.new(company).serializable_hash[:data][:attributes], status: 200
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:company_name, :sector, :location, :establishment)
  end

end
