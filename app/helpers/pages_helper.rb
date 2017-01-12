module PagesHelper
  def generate_list(enum)
    list = {}

    enum.keys.each do |type|
      list[type] = type
    end

    list.map { |k, v| [v, k] }
  end

  def text_location(value)
    I18n.t(value)
  end
end
