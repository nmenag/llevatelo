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
    hash_class_bootrap = { success: 'success', error: 'danger', alert: 'warning', notice: 'info' }
    hash_class_bootrap[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, message, class: "col-xs-11 col-sm-4 alert alert-#{bootstrap_class_for(msg_type)} fade in") do
          concat content_tag(:a, 'x', class: "close", data: { dismiss: 'alert'}, aria:{label:'close'} )
          concat message
        end
      )
    end
    nil
  end

  def badge_offer_type_button(offer_type)
    hash_class = {gift: 'given', barter: 'change' }
    content_tag(:figure, class: "btn-border btn-#{hash_class[offer_type.to_sym]}") do
      concat text_location(offer_type)
    end
  end

  def region_country
    country = Carmen::Country.coded('CO')
    country.subregions.map{|e| [e.name, e.name]}
  end
end
