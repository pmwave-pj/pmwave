module MstGroupsHelper

  def account_roll_check?
    MstGroup.find(current_user.group_id).account_edit_flg?
  end

  def pjmg_roll_check?
    MstGroup.find(current_user.group_id).pj_mg_edit_flg?
  end

  def topmsg_roll_check?
    MstGroup.find(current_user.group_id).top_msg_edit_flg?
  end

  def commsg_roll_check?
    MstGroup.find(current_user.group_id).com_mg_edit_flg?
  end

  def task_roll_check?
    MstGroup.find(current_user.group_id).progress_mg_edit_flg?
  end
  
end