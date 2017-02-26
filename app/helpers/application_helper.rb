module ApplicationHelper
  def generate_list(enum)
    list = {}

    enum.keys.each do |type|
      list[type] = text_location(type)
    end

    list.map { |k, v| [v, k] }
  end

  def text_location(value)
    I18n.t(value) if value.present?
  end

  def bootstrap_class_for(flash_type)
    hash_class_bootrap = { success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info' }
    hash_class_bootrap[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "col-xs-11 col-sm-4 alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(
          :button, 'x', class: "close", data: { dismiss: 'alert' })
            concat message
          end
        )
    end
    nil
  end


end
