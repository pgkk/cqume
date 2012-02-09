module FilmHelper

# 获得当前票价，如果有服务费改变其格式
  def get_price(price,service_price)
    if service_price > 0
      cprice = "￥#{price}+#{service_price}(服务费)"
    else
      cprice = "￥#{price}"
    end
    cprice
  end  
end
