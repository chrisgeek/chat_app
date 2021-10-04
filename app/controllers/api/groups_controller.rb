class Api::GroupsController < Api::BaseController
  before_action :set_group, only: %w[show update destroy join_group]

  def index
    @groups = Group.all

    render json: @groups
  end

  def show
    render_jsonapi_response(@group)
  end

  def create
    @group = current_user.groups.new(group_params)

    current_user.add_role :admin, @group if @group.save
    render_jsonapi_response(@group)
  end

  def join_group
    @group.users << current_user
    current_user.add_role :member, @group
    render json: 'User has been added to the group'
  end

  def update
    @group.update(group_params)
    render_jsonapi_response(@group)
  end

  def destroy
    @group.destroy
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description, users: [])
  end
end
