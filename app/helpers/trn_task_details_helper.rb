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
 
  #フラグの表示を✔にする
  def flg_check_tag(various_flg)
    result = ""
    if various_flg == true
      result = '✔'
    end
    #文字列をそのままHTMLタグとして出力
    result.html_safe
  end

  #IDから名前を表示する
  def user_nm_tag(user_id)
    result = MstUser.find(user_id).user_nm
    #文字列をそのままHTMLタグとして出力
    result.html_safe
  end

  #IDからタスク名を表示する
  def task_nm_tag(task_id)
    result = TrnTaskDetail.find(task_id).task_title
    #文字列をそのままHTMLタグとして出力
    result.html_safe
  end

  #期限（日付型）をYYYY/MM/DD形式の文字列で表示する
  def kigen_format(various_ymd)
    result = ""
    if various_ymd.present?
      result = various_ymd.strftime("%Y/%m/%d")
    end
    result
  end
 
end