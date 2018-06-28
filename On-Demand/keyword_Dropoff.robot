*** Keywords ***

Select Parcel       [Arguments]     ${parcel_type}
  ${css_parcel_type} =        Run Keyword If      '${parcel_type}' == 'ID'
  ...                         Set Variable        ${parcel_ID}
  ...                         ELSE IF            '${parcel_type}' == 'DOCUMENT'
  ...                         Set Variable        ${parcel_Document}
  ...                         ELSE IF            '${parcel_type}' == 'MAILING'
  ...                         Set Variable        ${parcel_Mailing}
  ...                         ELSE IF             '${parcel_type}' == 'FOOD'
  ...                         Set Variable        ${parcel_Food}
  ...                         ELSE IF             '${parcel_type}' == 'RETURN'
  ...                         Set Variable        ${parcel_Return}
  ...                         ELSE IF             '${parcel_type}' == 'PURCHASE'
  ...                         Set Variable        ${parcel_Purchase}
  ...                         ELSE IF             '${parcel_type}' == 'CASH'
  ...                         Set Variable        ${parcel_Cash}
  ...                         ELSE IF             '${parcel_type}' == 'INSURANCE'
  ...                         Set Variable        ${parcel_Insurance}
  Sleep  10s
  Click Element               ${css_parcel_type}
  Run Keyword If              '${parcel_type}' == 'CASH'          Input COD           1500
  ...    ELSE IF              '${parcel_type}' == 'INSURANCE'     Select Insurance    20000

Input COD       [Arguments]     ${amount}
  Sleep  5s
  Input Text                   ${COD_input}       ${amount}
  Click Element                ${done_btn}
  Wait Until Element Is Visible    ${parcel_cash_value}     10s
  ${cash_amount} =             Get Text                     ${parcel_cash_value}
  Should Be Equal              ${cash_amount}               ${amount}

Select Insurance    [Arguments]       ${value}
  Select Radio Button              insurance          ${value}
  Click Element                    ${done_btn}
  Wait Until Element Is Visible    ${pacel_insurance_value}   10s
  ${insurance_amount} =            Get Text                   ${pacel_insurance_value}
  Should Be Equal                  ${insurance_amount}        ${value}
