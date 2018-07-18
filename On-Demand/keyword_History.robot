*** Keywords ***

Click plus icon of history item     [Arguments]      ${item_no}
  Click Element         ${order_item}[${item_no}]${history_plus_icon}

Check history item display headers text correctly
  Table Row Should Contain            ${active_deliveries_table}      2     ${assignment_txt}
  Table Row Should Contain            ${active_deliveries_table}      2     ${pickup_txt}
  Table Row Should Contain            ${active_deliveries_table}      2     ${driver_txt}
  Table Row Should Contain            ${active_deliveries_table}      2     ${driver_phone_txt}
  Table Row Should Contain            ${active_deliveries_table}      2     ${pickup_duration_txt}
  Table Row Should Contain            ${active_deliveries_table}      4     ${jobno_txt}
  Table Row Should Contain            ${active_deliveries_table}      4     ${dropoff_txt}
  Table Row Should Contain            ${active_deliveries_table}      4     ${parcel_txt}
  Table Row Should Contain            ${active_deliveries_table}      4     ${distance_txt}
  Table Row Should Contain            ${active_deliveries_table}      4     ${dropoff_duration_txt}
  Table Row Should Contain            ${active_deliveries_table}      4     ${dropoff_eta_txt}
  Table Row Should Contain            ${active_deliveries_table}      4     ${dropoff_status_txt}
