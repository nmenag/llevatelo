module DeviseHelper
  def devise_error_messages!
    if resource.errors.present?
      resource.errors.full_messages.map do |msg|
        flash.now[:error] = resource.errors.full_messages.join(' | ')
      end
    end
  end
end
