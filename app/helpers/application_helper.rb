# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  #得到位置
  def location
    "重庆"
  end

  #得到 infoNavi.swf 调用的 xml 数据全局辅助方法
  def infoNavi
    "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' id='FlashId' title='logo' width='1040' height='200'>
                                    <param name='movie' value='/images/infoNavi.swf
?url=http://#{request.host}:#{request.port}/type/navigate&&&http://#{request.host}:#{request.port}/gbook/message'/><param name='quality' value='high' />
				<param name='wmode' value='Transparent' /><param name='swfversion' value='9.0.45.0' />
				<param name='expressinstall' value='/images/show/expressInstall.swf' />
                                    <!--[if !IE]>-->
                                        <object type='application/x-shockwave-flash' data='/images/infoNavi.swf
?url=http://#{request.host}:#{request.port}/type/navigate&&&http://#{request.host}:#{request.port}/gbook/message' width='1040' height='200'>
                                        <!--<![endif]--><param name='quality' value='high' />
                                        <param name='wmode' value='Transparent' />
					<param name='swfversion' value='9.0.45.0' />
                                        <param name='expressinstall' value='/images/show/expressInstall.swf' />
                                        <div>
                                            <h4>请安装最新版的 Adobe Flash Player</h4>
                                            <p>
                                                <a href='http://www.adobe.com/go/getflashplayer'>
                                                <img src='http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt=' Adobe Flash Player' width='112' height='33' />
												</a>
                                            </p>
                                        </div>
                                        <!--[if !IE]>-->
                                        </object>
                                    <!--<![endif]-->
                                </object>"
  end



  #得到 link.swf 调用的 xml 数据全局辅助方法
  def link
    "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' id='FlashId' title='logo' width='1040' height='50' style='margin-right:11px;'>
                                    <param name='movie' value='/images/link.swf?url=http://#{request.host}:#{request.port}/friend_link/link'/><param name='quality' value='high' />
				<param name='wmode' value='Transparent' /><param name='swfversion' value='9.0.45.0' />
				<param name='expressinstall' value='/images/show/expressInstall.swf' />
                                    <!--[if !IE]>-->
                                        <object type='application/x-shockwave-flash' data='/images/link.swf?url=http://#{request.host}:#{request.port}/friend_link/link' width='1040' height='50'>
                                        <!--<![endif]--><param name='quality' value='high' />
                                        <param name='wmode' value='Transparent' />
					<param name='swfversion' value='9.0.45.0' />
                                        <param name='expressinstall' value='/images/show/expressInstall.swf' />
                                        <div>
                                            <h4>请安装最新版的 Adobe Flash Player</h4>
                                            <p>
                                                <a href='http://www.adobe.com/go/getflashplayer'>
                                                <img src='http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt=' Adobe Flash Player' width='112' height='33' />
												</a>
                                            </p>
                                        </div>
                                        <!--[if !IE]>-->
                                        </object>
                                    <!--<![endif]-->
                                </object>"
  end


  #得到 Navigate.swf 调用的 xml 数据全局辅助方法
  def navigate
    "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' id='FlashId' title='logo' width='140' height='500'>
                                    <param name='movie' value='/images/Navigate.swf?url=http://#{request.host}:#{request.port}/type/navigate'/><param name='quality' value='high' />
				<param name='wmode' value='Transparent' /><param name='swfversion' value='9.0.45.0' />
				<param name='expressinstall' value='/images/show/expressInstall.swf' />
                                    <!--[if !IE]>-->
                                        <object type='application/x-shockwave-flash' data='/images/Navigate.swf?url=http://#{request.host}:#{request.port}/type/navigate' width='140' height='500'>
                                        <!--<![endif]--><param name='quality' value='high' />
                                        <param name='wmode' value='Transparent' />
					<param name='swfversion' value='9.0.45.0' />
                                        <param name='expressinstall' value='/images/show/expressInstall.swf' />
                                        <div>
                                            <h4>请安装最新版的 Adobe Flash Player</h4>
                                            <p>
                                                <a href='http://www.adobe.com/go/getflashplayer'>
                                                <img src='http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt=' Adobe Flash Player' width='112' height='33' />
												</a>
                                            </p>
                                        </div>
                                        <!--[if !IE]>-->
                                        </object>
                                    <!--<![endif]-->
                                </object>"
  end


  #小强的 swf 调用的 xml 数据全局辅助方法



end
