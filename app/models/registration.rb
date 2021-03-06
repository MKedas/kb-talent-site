class Registration < ActiveRecord::Base
  def paypal_url(return_path)
    values = {
        business: "#{Rails.application.secrets.paypal_merchant}",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        item_name: "KB Talent Registration Fee",
        amount: 25,
        no_shipping: 1,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
