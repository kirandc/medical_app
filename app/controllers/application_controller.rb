class ApplicationController < ActionController::API

  def serialize_resource(resources, serializer, root = nil)
    opts = { each_serializer: serializer, root: root }
    ActiveModelSerializers::SerializableResource.new(resources, opts) if resources
  end

  def render_success(data: nil, message: nil, status: :ok)
    render json: { data: data, message: message }, status: status
  end

  def render_error(data: nil, message: nil, status: :internal_server_error, errors: {})
    render json: { data: data, message: message, errors: errors }, status: status
  end
end
