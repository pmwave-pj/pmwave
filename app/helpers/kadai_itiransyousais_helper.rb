module KadaiItiransyousaisHelper
  #タスクが完了している場合、"済"を表字する
  #タスクが未完了の場合、完了ボタンを表字する
  def kadai_status_tag(kadai_itiransyousai)
    result = ""
    if kadai_itiransyousai.kadai_status == true
      result = '済'
    else
      result = '<a class="btn btn-sm btn-primary" href="' + kadai_itiransyousai_path(kadai_itiransyousai) + '">完了</a>'
    end
    #文字列をそのままHTMLタグとして出力
    result.html_safe
  end
 
  #期限（日付型）をYYYY/MM/DD形式の文字列で表示する
  def kadai_limit_format(kadai_limit)
    result = ""
    if kadai_limit.present?
      result = kadai_limit.strftime("%Y/%m/%d")
    end
    result
  end
 
end