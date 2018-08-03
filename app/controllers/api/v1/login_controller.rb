class Api::V1::LoginController < Api::V1::BaseController

  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze


  def wechat_params
    {
      appid: 'wx9968daef69f96fb4',
      secret: 'cefb48d746ddc96efcb845ae2c4778e7',
      js_code: params[:code],
      grant_type: "authorization_code"
    }
  end

  def wechat_user
    puts "started making a user"
    puts wechat_params
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def login
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    render :show
  end

end
