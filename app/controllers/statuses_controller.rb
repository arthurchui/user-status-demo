class StatusesController < InheritedResources::Base
  respond_to :json
  actions :index, :create

  def index
    super do |format|
      format.json { render json: collection.to_json(include: :user) }
    end
  end

  protected

  def collection
    @statuses ||= end_of_association_chain.includes(:user)
  end

end
