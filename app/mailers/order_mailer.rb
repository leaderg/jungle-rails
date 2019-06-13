class OrderMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def enhanced_order
    @enhanced_order ||= @order.line_items.all.map {|item| { product: item.product, quantity: item.quantity } }
  end
  helper_method :enhanced_order

  def order_subtotal_cents
    enhanced_order.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
  end
  helper_method :order_subtotal_cents

  def order_email order
    @order = order
    mail(to: 'leader.g@gmail.com', subject: 'Jungle Order Submitted')
  end
end
