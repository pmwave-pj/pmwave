module TrnTaskDetailsHelper
 
  #タスクが完了している場合、"済"を表字する
  #タスクが未完了の場合、完了ボタンを表字する
  def kanryo_tag(trn_task_detail)
    result = ""
    if trn_task_detail.end_flg == true
      result = '済'
    else
      result = '<a class="btn btn-sm btn-primary" href="' + kanryo_trn_task_detail_path(trn_task_detail) + '">完了</a>'
    end
    #文字列をそのままHTMLタグとして出力
    result.html_safe
  end
 
  #期限（日付型）をYYYY/MM/DD形式の文字列で表示する
  def kigen_format(end_ymd)
    result = ""
    if end_ymd.present?
      result = end_ymd.strftime("%Y/%m/%d")
    end
    result
  end
 
end