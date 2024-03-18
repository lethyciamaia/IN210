*** Settings ***
Library    SeleniumLibrary
Test Setup    Ouvrir Prestashop  
Test Teardown    Fermer Prestashop

*** Variables ***
${monPrestashopAddr}    http://www.qualifiez.fr/monPrestashop2/prestashop/index.php?
${searchedItemxPath}    //*[@id="search_widget"]/form/input[2]
${menuxPath}    //*[starts-with(@id, "category-")]/
${logoPath}    //*[@id="_desktop_logo"]/*

*** Test Cases ***
test
    Rechercher    t-shirt
    Verifier Recherche    t-shirt    1 produit

test2
    [Template]    Rechercher et verifier
    mug    5 produits
    t-shirt    1 produit

test3
    ${elem}     Find element in menu    ${menuxPath}    VÊTEMENTS
    Element Text Should Be    ${elem}    VÊTEMENTS    ignore_case=True
    Mouse hover    ${elem}    HOMMES    ${menuxPath}

*** Keywords ***
Ouvrir Prestashop
    Open Browser    ${monPrestashopAddr}    Chrome  
    Title Should Be    monPrestashop
    Maximize Browser Window

Fermer Prestashop
    Close Browser


Rechercher    
    [Arguments]    ${item}    
    Input Text    xpath=${searchedItemxPath}    ${item}
    Press Keys     xpath=${searchedItemxPath}    RETURN

Verifier Recherche
    [Arguments]    ${item}    ${quantity}
    Element Text Should Be    xpath=//*[@id="js-product-list-top"]/div[1]/p    Il y a ${quantity}.
    @{liste}    Get WebElements    xpath=//*[@id="js-product-list"]/div[1]/div/article/div/div[2]/h2/a
    FOR    ${elt}    IN    @{liste}
        Element Should Contain    ${elt}    ${item}    ignore_case=TRUE
    END

Rechercher et verifier
    [Arguments]    ${item}    ${quantity}
    Rechercher    ${item}
    Verifier Recherche    ${item}    ${quantity}

# 7/
Find element in menu
    [Arguments]    ${path}    ${elem_name}
    ${menu_items}    Get WebElements    xpath=${path}a
    FOR    ${item}    IN    @{menu_items}
        ${item_name}    Get Text    ${item}
        IF    '${item_name}' == '${elem_name}' 
            RETURN    ${item}
        END
    END
    RETURN    ${EMPTY}

Mouse hover
    [Arguments]    ${elem}    ${subcategory}    ${path}
    Mouse Over    ${elem}
    ${subelem}    Find element in menu    ${path}/descendant::    ${subcategory}
    Element Should Be Visible    ${subelem}
    Mouse Out    ${elem}
    # Positionne le souris loin du menu et du sousmenu
    Mouse Over    ${logoPath} 
    Wait Until Element Is Not Visible    ${subelem}    5s
    