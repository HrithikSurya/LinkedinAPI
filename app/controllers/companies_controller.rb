class CompaniesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    @companies = Company.all #need to be paginate
    render json: @companies, status: 200
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

  def show #body remains blank 'cause we have used jbuilder for crafting the view for show action
    # if @company
    #   render_company_serializer(@company)
    # else
    #   render json: 'Company Not Found', status: 404
    # end
  end

  def update
    if @company.update(company_params)
      # render_company_serializer(@company)
      render 'update', status: 200
    else
      render json: @company.errors.full_messages, status: 422
    end
  end

  def destroy
    if @company
      if @company.destroy
        # render json: "Company Deleted Successfully", status: 200
        render 'destroy', status: 200   
      else 
        render json: @company.errors.full_messages, status: 422
      end
    else
      render json: 'Company Not Found', status: 404
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
