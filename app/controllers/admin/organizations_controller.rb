class Admin::OrganizationsController < Admin::BaseController
  include CommonOrganizationActions
  
  def new
    @organization = Organization.new
    respond_to do |format|
      format.html
      format.json { render json: @organization }
    end
  end

  def update
    @organization = Organization.find(params[:id])
    @organization.update!(org_params)
    respond_to do |format|
      format.html { render "show" }
      format.json { render json: @organization }
    end
  end

  def create
    @organization = Organization.create!(org_params)
    respond_to do |format|
      format.html { render "show" }
      format.json { render json: @organization }
    end
  end

  def destroy
    Organization.delete(params[:id])
    respond_to do |format|
      format.html { render "index" }
      format.json { render json: Organization.all}
    end
  end
private
  def find_organizations
    Organization.all
  end

  def find_organization
    Organization.find(params[:id])
  end

  def org_params
    params.require(:organization).permit(:name, :contact_name, :contact_email)
  end
end
