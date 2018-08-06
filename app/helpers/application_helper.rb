module ApplicationHelper
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
    if user_id.nil?
     result = ""
    else
     result = MstUser.find(user_id).user_nm
    end
    #文字列をそのままHTMLタグとして出力
    result.html_safe
  end

  #ロールIDから名前を表示する
  def group_nm_tag(group_id)
    if group_id.nil?
     result = ""
    else
     result = MstGroup.find(group_id).group_nm
    end
    #文字列をそのままHTMLタグとして出力
    result.html_safe
  end

  #IDからタスク名を表示する
  def task_nm_tag(task_id)
    if task_id.nil?
     result = ""
    else
     result = TrnTaskDetail.find(task_id).task_title
    end
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
 
  #期限（日付型）をYYYY/MM/DD hh:mm:ss 形式の文字列で表示する
  def dt_format(various_ymd)
    result = ""
    if various_ymd.present?
      result = various_ymd.strftime("%Y/%m/%d %H:%M:%S")
    end
    result
  end
end