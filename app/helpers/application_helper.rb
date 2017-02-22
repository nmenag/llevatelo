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
end
