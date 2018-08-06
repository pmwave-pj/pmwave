module TrnKadaiKanrisHelper
  #タスクが完了している場合、"済"を表字する
  #タスクが未完了の場合、完了ボタンを表字する
  def kadai_status_tag(trn_kadai_kanri)
    result = ""
    if trn_kadai_kanri.kadai_status == true
      result = '済'
    else
      result = '<a class="btn btn-sm btn-primary" href="' + trn_kadai_kanri_path(trn_kadai_kanri) + '">完了</a>'
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
  def kadai_try_d_format(kadai_try_d)
    result = ""
    if kadai_try_d.present?
      result = kadai_try_d.strftime("%Y/%m/%d")
    end
    result
  end
  def kadai_try2_d_format(kadai_try2_d)
    result = ""
    if kadai_try2_d.present?
      result = kadai_try2_d.strftime("%Y/%m/%d")
    end
    result
  end
  def kadai_try3_d_format(kadai_try3_d)
    result = ""
    if kadai_try3_d.present?
      result = kadai_try3_d.strftime("%Y/%m/%d")
    end
    result
  end
  def kadai_inst_ymd_format(kadai_inst_ymd)
    result = ""
    if kadai_inst_ymd.present?
      result = kadai_inst_ymd.strftime("%Y/%m/%d")
    end
    result
  end
  def kadai_updt_ymd_format(kadai_updt_ymd)
    result = ""
    if kadai_updt_ymd.present?
      result = kadaiupdt_ymd.strftime("%Y/%m/%d")
    end
    result
  end
  def kadai_del_ymd_format(kadai_del_ymd)
    result = ""
    if kadai_del_ymd.present?
      result = kadai_del_ymd.strftime("%Y/%m/%d")
    end
    result
  end
  def kadai_updt_s_end_format(kadai_updt_s_end)
    result = ""
    if kadai_updt_s_end.present?
      result = kadai_updt_s_end.strftime("%Y/%m/%d")
    end
    result
  end
  def kadai_updt_t_end_format(kadai_updt_t_end)
    result = ""
    if kadai_updt_t_end.present?
      result = kadai_updt_t_end.strftime("%Y/%m/%d")
    end
    result
  end
  
  #IDから名前を表示する
 def kadai_phase_tag(phase_id)
   if phase_id.nil?
    result = ""
   else
    result = Phaseitem.find(phase_id).phaseitem
   end
   
 def kadai_impt_tag(impt_id)
   if impt_id.nil?
    result = ""
   else
    result = Phaseitem.find(impt_id).imptitem
   end
 end
 
 def kadai_status_tag2(status_id2)
   if status_id2.nil?
    result = ""
   else
    result = Phaseitem.find(status_id2).statusitem
   end
 end

 def kadai_cgr_tag(cgr_id)
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
