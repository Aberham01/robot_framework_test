#Automation Test for Tast Case 1, 4, 8, 10

*** Settings ***
Library           SeleniumLibrary
Library           clipboard

*** Variables ***
${browser}    chrome
*** Test Cases ***
#==========================================================================================================================================================================
#Ausgaben
#TC_001 Add Position by providing all the mandtory fiels on "Sachkosten"
Test case 1 - TC_001
     Open Browser     https://proandi-easy:W53W8tIe@easy-stage.wirfoerdern.net/     ${browser}
     Set Browser Implicit Wait      5
     Input Text       id=username                             testantragsteller.Aberham.am@example.com
     Input Password   id=password                             EasyStage2023Test
     Click Button     id=login
     Maximize Browser Window
     Sleep      5
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //div[@title='Klicken Sie hier um einen neuen Antrag zu erstellen.']/descendant::a
     Sleep    1
     Go To    https://easy-stage.wirfoerdern.net/foerderantrag-erstellen/?ordering=kbez&limit=100&offset=0
     Wait Until Keyword Succeeds    30seconds    1seconds    Wait Until Element Is Visible    //span[text()='EASY - Testautomatisierung']
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    id=FoerderfinderFoerderangeboteTable_action_1
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    id=step_finanz_panel_header
     Sleep    5
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //button[@id='1005_add']/descendant::span[text()='Position hinzufügen']
     Wait Until Keyword Succeeds    30seconds    1seconds    Input Text    id=1005_new_position_bezeichnung    Test_Auto_1
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    id=1005_new_position_wert
     IF    '${browser}'=='edge'
         Wait Until Keyword Succeeds    30seconds    1seconds    Input Text    id=1005_new_position_wert    1
     ELSE
         Sleep    2
         Press Keys    None    CTRL+A
         Sleep    2
         clipboard.copy   100,00
         Sleep    2
         Press Keys    None    CTRL+v
         Sleep    2
     END
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //span[text()='Speichern']
#==========================================================================================================================================================================
#Finanzierung
#TC_004 Add Position by providing all the mandtory fields on "Eigenmittel"
Test case 4 - TC_004
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //button[@id='1016_add']/descendant::span[text()='Position hinzufügen']
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //span[@title='--- Bitte wählen Sie ---']
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //span[text()='Spenden']
     Wait Until Keyword Succeeds    30seconds    1seconds    Input Text    id=1016_new_position_bezeichnung    Test_Auto_1
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    id=1016_new_position_wert
     IF    '${browser}'=='edge'
         Wait Until Keyword Succeeds    30seconds    1seconds    Input Text    id=1016_new_position_wert    1
     ELSE
         Sleep    2
         Press Keys    None    CTRL+A
         Sleep    2
         clipboard.copy   10,00
         Sleep    2
         Press Keys    None    CTRL+v
         Sleep    2
     END
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //span[text()='Speichern']

#==========================================================================================================================================================================
#TC_008 Edit Position by providing all the mandtory fields "Eigenmittel"
Test case 8 - TC_008
     # EDIT
     Reload Page
     Sleep    5
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    id=step_finanz_panel_header
     Sleep    2
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //div[text()='Spenden: Test_Auto_1']/../descendant::button[contains(@id, '1016_0_edit')]
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    id=1016_0_wert
     Sleep    1
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //input[@id='1016_0_wert']/../descendant::i
     Sleep    1
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    id=1016_0_wert
     IF    '${browser}'=='edge'
         Wait Until Keyword Succeeds    30seconds    1seconds    Input Text    id=1016_0_wert    2
     ELSE
         Press Keys    None    CTRL+A
         Sleep    2
         clipboard.copy    20,00
         Sleep    2
         Press Keys    None    CTRL+v
         Sleep    2
     END
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //span[text()='Speichern']
     Sleep    2
#==========================================================================================================================================================================
#TC_010 Delete Position on "Eigenmittel"
Test case 10 - TC_010
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //div[text()='Spenden: Test_Auto_1']/../descendant::button[contains(@id, '_delete')]
     Wait Until Keyword Succeeds    30seconds    1seconds    Click Element    //button[text()='Löschen']
     Sleep    2

#==========================================================================================================================================================================
