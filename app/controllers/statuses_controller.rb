class StatusesController < InheritedResources::Base
  respond_to :json
  actions :index, :create, :update

  def index
    super do |format|
      format.json { render json: collection.to_json }
    end
  end

  def create
    @status = current_user.status
    if @status
      update!
    else
      @status = Status.new(params[:status])
      @status.user = current_user
      create!
    end
    WebsocketRails[:statuses].trigger 'sync', current_user.status
  end

  protected

  def collection
    @statuses ||= end_of_association_chain.includes(:user)
  end

end
