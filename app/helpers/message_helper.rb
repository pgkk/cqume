#coding: utf-8
module MessageHelper

  # 获得所有可用播放厅，包括VIP、情侣、IMAX，以数组返回
  def get_all_room(cinema=Cinema.new)
    hall_array = array_item_add_string('#厅', (1..(cinema.hall)).to_a)
    hall_array += array_item_add_string('VIP#', (1..(cinema.viphall)).to_a) if cinema.viphall != 0
    hall_array += array_item_add_string('情侣厅#', (1..(cinema.loverhall)).to_a) if cinema.loverhall != 0
    hall_array += array_item_add_string('IMAX#', (1..(cinema.imaxhall)).to_a) if cinema.imaxhall != 0
    return hall_array
  end


  # 获得当前票价，如果有服务费改变其格式
  def get_price(price,service_price)
    if service_price > 0
      cprice = "￥#{price}+#{service_price}(服务费)"
    else
      cprice = "￥#{price}"
    end
    cprice
  end


  private

  # 将指定字符串匹配进数组中每个项
  def array_item_add_string(string,array)
    if array.size == 1
      array[0] = string.sub(/#/, '')
    else
      array.each do |i|
        array[i-1] = string.sub(/#/, i.to_s)
      end
    end
    array
  end

  

end
