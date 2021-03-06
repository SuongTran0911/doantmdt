class Cart < ActiveRecord::Base
  has_many :line_items
  
  def total_price
    # convert to array so it doesn't try to do sum on database directly
    line_items.to_a.sum(&:full_price)
  end
  
  def paypal_url(return_url)
    values = {
      :business => 'suongtran9195@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :notify_url => "#{Rails.application.secrets.app_host}/hook",
      :invoice => id
     
    }
    line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.unit_price,
        "item_name_#{index+1}" => item.product.nameProduct,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
   
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
