module TrnYokenKanrisHelper
  #タスクが完了している場合、"済"を表字する
  #タスクが未完了の場合、完了ボタンを表字する
  def yoken_status_tag(trn_yoken_kanri)
    result = ""
    if trn_yoken_kanri.yoken_status == true
      result = '済'
    else
      result = '<a class="btn btn-sm btn-primary" href="' + trn_yoken_kanri_path(trn_yoken_kanri) + '">完了</a>'
    end
    #文字列をそのままHTMLタグとして出力
    result.html_safe
  end
 
  #期限（日付型）をYYYY/MM/DD形式の文字列で表示する
  def yoken_limit_format(yoken_limit)
    result = ""
    if yoken_limit.present?
      result = yoken_limit.strftime("%Y/%m/%d")
    end
    result
  end
  def yoken_try_d_format(yoken_try_d)
    result = ""
    if yoken_try_d.present?
      result = yoken_try_d.strftime("%Y/%m/%d")
    end
    result
  end
  def yoken_try2_d_format(yoken_try2_d)
    result = ""
    if yoken_try2_d.present?
      result = yoken_try2_d.strftime("%Y/%m/%d")
    end
    result
  end
  def yoken_try3_d_format(yoken_try3_d)
    result = ""
    if yoken_try3_d.present?
      result = yoken_try3_d.strftime("%Y/%m/%d")
    end
    result
  end
  def yoken_inst_ymd_format(yoken_inst_ymd)
    result = ""
    if yoken_inst_ymd.present?
      result = yoken_inst_ymd.strftime("%Y/%m/%d")
    end
    result
  end
  def yoken_updt_ymd_format(yoken_updt_ymd)
    result = ""
    if yoken_updt_ymd.present?
      result = yokenupdt_ymd.strftime("%Y/%m/%d")
    end
    result
  end
  def yoken_del_ymd_format(yoken_del_ymd)
    result = ""
    if yoken_del_ymd.present?
      result = yoken_del_ymd.strftime("%Y/%m/%d")
    end
    result
  end
  def yoken_updt_s_end_format(yoken_updt_s_end)
    result = ""
    if yoken_updt_s_end.present?
      result = yoken_updt_s_end.strftime("%Y/%m/%d")
    end
    result
  end
  def yoken_updt_t_end_format(yoken_updt_t_end)
    result = ""
    if yoken_updt_t_end.present?
      result = yoken_updt_t_end.strftime("%Y/%m/%d")
    end
    result
  end
  
  #IDから名前を表示する
 def yoken_phase_tag(phase_id)
   if phase_id.nil?
    result = ""
   else
    result = Phaseitem.find(phase_id).phaseitem
   end
   
 def yoken_impt_tag(impt_id)
   if impt_id.nil?
    result = ""
   else
    result = Phaseitem.find(impt_id).imptitem
   end
 end
 
 def yoken_status_tag(status_id)
   if status_id.nil?
    result = ""
   else
    result = Phaseitem.find(status_id).statusitem
   end
 end

 def yoken_cgr_tag(cgr_id)
   if cgr_id.nil?
    result = ""
   else
    result = Phaseitem.find(cgr_id).cgritem
   end
 end
   
   #文字列をそのままHTMLタグとして出力
   result.html_safe
 end
  
end
