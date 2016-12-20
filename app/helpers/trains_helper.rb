module TrainsHelper
  def current_order_wagons(train)
    train.order_wagons ? train.wagons.head : train.wagons.tail
  end
end
