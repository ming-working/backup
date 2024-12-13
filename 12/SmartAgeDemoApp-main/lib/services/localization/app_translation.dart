import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        /* English */
        'en_US': {
          // Dashboard
          "dashBoardHome": "Home",
          "dashBoardTitle": "Health Overview",
          "dashBoardMessageButton": "Message",
          "dashBoardCircleofSupport": "CoS",
          "dashBoardAlert": "Alert",
          "dashBoardActivityClockTitle": "Activity Clock",
          "dashBoardCheckActivityReport": "Check Activity Analysis",
          "dashBoardActivityClockRoomEmpty": "------",
          "dashBoardActivityClockBedroom": "Bedroom",
          "dashBoardActivityClockBathroom": "Bathroom",
          "dashBoardActivityClockKitchen": "Kitchen",

          // Alert
          "warningTitle": "Latest Emergency Alert",
          "warningCheckAllAlert": "Check all alerts",
          "warningNotWakeUp": "The Elderly has not got up yet!",

          // Health Block
          "healthBlockTitle": "Today's Health Index",
          "healthBlockHeartRate": "HR",
          "healthBlockBloodOxygen": "SPO2",
          "healthBlockBloodPressure": "BP",
          "healthBlockBodyTemp": "Temp",
          "healthBlockBloodSugar": "H'Stix",
          "healthBlockHealthTitle": "Health Details",

          // Warning Screen
          "warningScreenTitle": "Health Alerts",
          "warningScreenFormTitle": "Assistant Form",
          "warningScreenLevelNormal": "Normal",
          "warningScreenLevelAbnormal": "Abnormal",
          "warningScreenLevelWarning": "Warning",
          "warningScreenContactElderly": "Contact The Elderly",
          "warningScreenSettleNow": "Settle Now",
          "warningScreenRemindLater": "Remind Me Later",
          "warningScreenCircleOfSupport": "The Elderly's Circle of Support",
          "warningScreenLocation": "Elderly Centre/ Acvitiy Centre",
          "warningScreenSave":
              "Contact the elderly immediately to ensure safety",
          "warningScreenCallImediately": "Call Immediately",
          "warningScreenWakeUpTime": "Wake-Up time is",
          "warningSleepPattern": "Sleeping Pattern",
          "warningScreenNocturia": "Nocturia",
          "warningScreenPastRestroomVisit":
              "Average Number of Restroom VIsits at Night over",
          "warningScreenPresentRestroomVisit":
              "The Number of Restroom Visits in this week",
          "warningScreenToiletHabit": "Toileting Habit",
          "warningScreenCheckAllActivities": "Check All Activities",

          // Profile Screen
          "profileScreenTitle": "Profile",
          "profileScreenEditProfiel": "Edit Profile",
          "profileScreenSettings": "Settings",
          "profileScreenInformation": "Information",
          "profileScreenBillingDetails": "Billing Details",
          "profileScreenUserManagement": "User Management",
          "profileScreenLogout": "Log Out",
          "profileScreenLogoutDialog": "Do you want to continue to logout?",

          // Global Variable
          // Normal Text
          "globalYes": "Yes",
          "globalNo": "No",
          "globalCancel": "Cancel",
          "globalNext": "Next",
          "globalDelete": "Delete",
          "globalCall": "Call",
          "globalSetting": "Setting",

          // Authentication
          "globalLogIn": "Login",
          "globalSignIn": "Sign In",
          "globalSignUp": "Sign Up",
          "globalRegister": "Register",

          // Credential
          "globalEmail": "Email",
          "globalPhoneNo": "Phone Number",
          "globalPassword": "Password",
          "globalRepeatPassword": "Repeat Password",
          "globalFullName": "Full Name",
          "globalForgetPassword": "Forget Password",

          // Notification Control
          "notificationBreakfast": "Breakfast",
          "notificationNoBreakfast": "No Breakfast",

          "notificationLunch": "Lunch",
          "notificationNoLunch": "No Lunch",

          "notificationDinner": "Dinner",
          "notificationNoDinner": "No Dinner",

          "notificationOtherMealTime": "Other Meal Times",
          "notificationNotGetUp": "Not get up",
          "notificationNotSleep": "Not sleep",
          "notificationToiletOverStay": "Overstay in Bathroom",
          "notificationExcessiveDoorOpen": "Excessive Door Opening Hours",
          "notificationActivityLevel":
              "Average Activity Level is Lower Than the Past Week",
          "notificationMeals": "Meals",
          "notificationSleeping": "Sleeping",
          "notificationGoToRestroom": "Restroom",
          "notificationDoorOpen": "Door Open",
          "notificationActiveTime": "Active Time",

          // Circle of Support Screen
          "CoSTitle": "Circle of Support",
          "CoSLeader": "Super Admin",
          "CoSMember": "Member",
          "CoSAddMember": "Add Member",
          "CoSManageMember": "Manage Member",
          "CoSLeave": "Leave Circle of Support",
          "CoSLeaveDialog": "Do you want to leave the Circle of Support?",
          "CoSKickMember": "Kick",

          // Activity Report
          "activityScreenReportTitle": "Activity Analysis",
          "activityScreenNormal": "Normal",
          "activityScreenAbnormal": "Abnormal",
          "activityScreenResult": "Data Analysis Results",
          "activityScreenBefore": "(Before)",
          "activityScreenAfter": "(After)",
          "activityScreenNormalDescription": "No activity during sleep",
          "activityScreenAbnormalDescription": "Activity during sleep",

          // Settings
          "settingsScreenTitle": "Settings",
          "settingsLangEng": "Eng",
          "settingsLangZhHK": "中文(繁體)",
          "settingsLangZhCN": "中文(简体)",
          "settingsSave": "Save Changes?",

          "CoSNavigationBar": "CoS",
        },

        /* Traditional Chinese */
        'zh_HK': {
          // Dashboard
          "dashBoardHome": "主頁",
          "dashBoardTitle": "健康概覽",
          "dashBoardMessageButton": "信息",
          "dashBoardCircleofSupport": "支援圈",
          "dashBoardAlert": "通知",
          "dashBoardActivityClockTitle": "居家活動時間表",
          "dashBoardCheckActivityReport": "查看生活方式變化表",
          "dashBoardActivityClockRoomEmpty": "------",
          "dashBoardActivityClockBedroom": "臥室",
          "dashBoardActivityClockBathroom": "浴室",
          "dashBoardActivityClockKitchen": "厨房",

          // Alert
          "warningTitle": "最新緊急警報",
          "warningCheckAllAlert": "查看所有警報",
          "warningNotWakeUp": "仍未起床",

          // Health Block
          "healthBlockTitle": "今日維生指數",
          "healthBlockHeartRate": "心率",
          "healthBlockBloodOxygen": "血氧含量",
          "healthBlockBloodPressure": "血壓",
          "healthBlockBodyTemp": "身體溫度",
          "healthBlockBloodSugar": "血糖水平",
          "healthBlockHealthTitle": "健康詳情",

          // Warning Screen
          "warningScreenTitle": "健康警告信號",
          "warningScreenFormTitle": "輔助問卷",
          "warningScreenLevelNormal": "正常",
          "warningScreenLevelAbnormal": "異常",
          "warningScreenLevelWarning": "警告",
          "warningScreenContactElderly": "聯絡長者",
          "warningScreenSettleNow": "立即處理",
          "warningScreenRemindLater": "稍後處理",
          "warningScreenCircleOfSupport": "支援圈成員",
          "warningScreenLocation": "長者鄰舍/活動中心的職員",
          "warningScreenSave":
              "請立即聯絡爸爸，確保安全", // TODO: need to change to the non-gender specific
          "warningScreenCallImediately": "立即通話",
          "warningScreenWakeUpTime": "正常範圍:起床時間為",
          "warningSleepPattern": "睡眠習慣",
          "warningScreenNocturia": "夜尿頻繁情況",
          "warningScreenPastRestroomVisit": "過去一星期的平均如廁次數為: ",
          "warningScreenPresentRestroomVisit": "如廁次數增加了: ",
          "warningScreenToiletHabit": "如厠習慣",
          "warningScreenCheckAllActivities": "查看所有活動",

          // Profile Screen
          "profileScreenTitle": "個人資料",
          "profileScreenEditProfiel": "編輯個人資料",
          "profileScreenSettings": "設定",
          "profileScreenInformation": "資訊",
          "profileScreenBillingDetails": "賬單詳情",
          "profileScreenUserManagement": "用戶管理",
          "profileScreenLogout": "登出",
          "profileScreenLogoutDialog": "你是否想繼續登出?",

          // Global Variable
          // Normal Text
          "globalYes": "是",
          "globalNo": "否",
          "globalCancel": "取消",
          "globalNext": "下一步",
          "globalDelete": "刪除",
          "globalCall": "通話",
          "globalSetting": "設定",

          // Authentication
          "globalLogIn": "登入",
          "globalSignIn": "登入",
          "globalSignUp": "註冊",
          "globalRegister": "註冊",

          // Credential
          "globalEmail": "電子郵件",
          "globalPhoneNo": "電話號碼",
          "globalPassword": "密碼",
          "globalRepeatPassword": "重複密碼",
          "globalFullName": "全名",
          "globalForgetPassword": "忘記密碼",

          // Notification Control
          "notificationBreakfast": "早餐",
          "notificationNoBreakfast": "No Breakfast",

          "notificationLunch": "午餐",
          "notificationNoLunch": "No Lunch",

          "notificationDinner": "晚餐",
          "notificationNoDinner": "No Dinner",

          "notificationOtherMealTime": "Other Meal Times",
          "notificationNotGetUp": "Not get up",
          "notificationNotSleep": "Not sleep",
          "notificationToiletOverStay": "Overstay in Bathroom",
          "notificationExcessiveDoorOpen": "Excessive Door Opening Hours",
          "notificationActivityLevel":
              "Average Activity Level is Lower Than the Past Week",
          "notificationMeals": "飲食",
          "notificationSleeping": "睡眠",
          "notificationGoToRestroom": "如厠",
          "notificationDoorOpen": "門開",
          "notificationActiveTime": "活動量",

          // Circle of Support Screen
          "CoSTitle": "支援團",
          "CoSLeader": "支援團隊長",
          "CoSMember": "支援團成員",
          "CoSAddMember": "添加成員",
          "CoSManageMember": "管理",
          "CoSLeave": "離開支援團",
          "CoSLeaveDialog": "如果您不再是爸爸的支援團成員，您可隨時離開",
          "CoSKickMember": "剔除",

          // Activity Report
          "activityScreenReportTitle": "活動分析",
          "activityScreenNormal": "正常活動",
          "activityScreenAbnormal": "異常活動",
          "activityScreenResult": "數據分析結果",
          "activityScreenBefore": "(前)",
          "activityScreenAfter": "(後)",
          "activityScreenNormalDescription": "在睡覺期間並無活動",
          "activityScreenAbnormalDescription": "在夜間有異常活動",

          // Settings
          "settingsScreenTitle": "設置",
          "settingsLangEng": "Eng",
          "settingsLangZhHK": "中文(繁體)",
          "settingsLangZhCN": "中文(简体)",
          "settingsSave": "儲存此改變？",

          "CoSNavigationBar": "支援團",
        },

        /* Simplified Chinese */
        'zh_CN': {
          // Dashboard
          "dashBoardHome": "主页",
          "dashBoardTitle": "健康概览",
          "dashBoardMessageButton": "信息",
          "dashBoardCircleofSupport": "支援团",
          "dashBoardAlert": "通知",
          "dashBoardActivityClockTitle": "居家活动时间表",
          "dashBoardCheckActivityReport": "查看生活方式变化表",
          "dashBoardActivityClockRoomEmpty": "------",
          "dashBoardActivityClockBedroom": "卧室",
          "dashBoardActivityClockBathroom": "浴室",
          "dashBoardActivityClockKitchen": "厨房",

          // Alert
          "warningTitle": "最新紧急警报",
          "warningCheckAllAlert": "查看所有警报",
          "warningNotWakeUp": "仍未起床！",

          // Health Block
          "healthBlockTitle": "今日维生指数",
          "healthBlockHeartRate": "心率",
          "healthBlockBloodOxygen": "血氧含量",
          "healthBlockBloodPressure": "血压",
          "healthBlockBodyTemp": "身体温度",
          "healthBlockBloodSugar": "血糖水平",
          "healthBlockHealthTitle": "健康详情",

          // Warning Screen
          "warningScreenTitle": "健康警告信号",
          "warningScreenFormTitle": "辅助问卷",
          "warningScreenLevelNormal": "正常",
          "warningScreenLevelAbnormal": "异常",
          "warningScreenLevelWarning": "警告",
          "warningScreenContactElderly": "联络长者",
          "warningScreenSettleNow": "立即处理",
          "warningScreenRemindLater": "稍后处理",
          "warningScreenCircleOfSupport": "支援团成员",
          "warningScreenLocation": "长者邻舍/活动中心的职员",
          "warningScreenSave":
              "请立即联络爸爸，确保安全", // TODO: need to change to the non-gender specific
          "warningScreenCallImediately": "立即通话",
          "warningScreenWakeUpTime": "正常范围:起床时间为",
          "warningSleepPattern": "睡眠习惯",
          "warningScreenNocturia": "夜尿频繁情况",
          "warningScreenPastRestroomVisit": "过去一星期的平均如厕次数为: ",
          "warningScreenPresentRestroomVisit": "如廁次數增加了: ",
          "warningScreenToiletHabit": "如厕习惯",
          "warningScreenCheckAllActivities": "查看所有活动",

          // Profile Screen
          "profileScreenTitle": "个人资料",
          "profileScreenEditProfiel": "编辑个人资料",
          "profileScreenSettings": "设定",
          "profileScreenInformation": "信息",
          "profileScreenBillingDetails": "账单详情",
          "profileScreenUserManagement": "用户管理",
          "profileScreenLogout": "注销",
          "profileScreenLogoutDialog": "你是否想继续注销？",

          // Global Variable
          // Normal Text
          "globalYes": "是",
          "globalNo": "否",
          "globalCancel": "取消",
          "globalNext": "下一步",
          "globalDelete": "删除",
          "globalCall": "通话",
          "globalSetting": "设置",

          // Authentication
          "globalLogIn": "登入",
          "globalSignIn": "登入",
          "globalSignUp": "註冊",
          "globalRegister": "註冊",

          // Credential
          "globalEmail": "电子邮件",
          "globalPhoneNo": "电话号码",
          "globalPassword": "密码",
          "globalRepeatPassword": "重复密码",
          "globalFullName": "全名",
          "globalForgetPassword": "忘记密码",

          // Notification Control
          "notificationBreakfast": "早餐",
          "notificationNoBreakfast": "No Breakfast",

          "notificationLunch": "午餐",
          "notificationNoLunch": "No Lunch",

          "notificationDinner": "晚餐",
          "notificationNoDinner": "No Dinner",

          "notificationOtherMealTime": "Other Meal Times",
          "notificationNotGetUp": "Not get up",
          "notificationNotSleep": "Not sleep",
          "notificationToiletOverStay": "Overstay in Bathroom",
          "notificationExcessiveDoorOpen": "Excessive Door Opening Hours",
          "notificationActivityLevel":
              "Average Activity Level is Lower Than the Past Week",
          "notificationMeals": "饮食",
          "notificationSleeping": "睡眠",
          "notificationGoToRestroom": "如厕",
          "notificationDoorOpen": "门开",
          "notificationActiveTime": "活动量",

          // Circle of Support Screen
          "CoSTitle": "支援团",
          "CoSLeader": "支持团队长",
          "CoSMember": "支持团成员",
          "CoSAddMember": "添加成员",
          "CoSManageMember": "管理",
          "CoSLeave": "离开支援团",
          "CoSLeaveDialog": "如果您不再是爸爸的支持团成员，您可随时离开",
          "CoSKickMember": "剔除",

          // Activity Report
          "activityScreenReportTitle": "活动分析",
          "activityScreenNormal": "正常活动",
          "activityScreenAbnormal": "异常活动",
          "activityScreenResult": "数据分析结果",
          "activityScreenBefore": "(前)",
          "activityScreenAfter": "(后)",
          "activityScreenNormalDescription": "在睡觉期间并无活动",
          "activityScreenAbnormalDescription": "在夜间有异常活动",

          // Settings
          "settingsScreenTitle": "设置",
          "settingsLangEng": "Eng",
          "settingsLangZhHK": "中文(繁體)",
          "settingsLangZhCN": "中文(简体)",
          "settingsSave": "储存此改变？",

          "CoSNavigationBar": "支援团",
        },
      };
}
