class OperationsController < ApplicationController
  def index
    @operations = Operation.all
  end

  def new
    @operation = Operation.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    @operation = @group.operations.build(operation_params)
    @operation.author_id = current_user.id
    @group.operations << @operation

    if @operation.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def operation_params
    params.require(:operation).permit('name', 'amount')
  end
end
