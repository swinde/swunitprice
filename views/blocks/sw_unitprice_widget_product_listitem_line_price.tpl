[{oxhasrights ident="SHOWARTICLEPRICE"}]
    [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
    [{assign var="tprice"     value=$product->getTPrice()}]
    [{assign var="price"      value=$product->getPrice()}]

    [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
    <span class="oldPrice text-muted">
        <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
    </span>
<br/>
    [{/if}]

                        [{block name="widget_product_listitem_line_price_value"}]
                            <span id="productPrice_[{$testid}]" class="lead price text-nowrap">
                                [{if $product->isRangePrice()}]
                                    [{oxmultilang ident="PRICE_FROM"}]
                                    [{if !$product->isParentNotBuyable()}]
                                        [{$product->getFMinPrice()}]
                                    [{else}]
                                        [{$product->getFVarMinPrice()}]
                                    [{/if}]
                                [{else}]
                                    [{if !$product->isParentNotBuyable()}]
                                        [{$product->getFPrice()}]
                                    [{else}]
                                        [{$product->getFVarMinPrice()}]
                                    [{/if}]
                                [{/if}]
                                [{$currency->sign}]
                                [{if $oView->isVatIncluded()}]
                                    [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]*[{/if}]
                                [{/if}]
                            </span><br/>
                        [{/block}]

[{if $oUnitPrice}]
    <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit text-nowrap">
          [{*$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()*}]
        [{if $product->oxarticles__oxunitname->value  == '_UNIT_KG'}]
            [{*Gewicht von Kilogramm in Gramm umrechnen, wenn KG*}]
            [{$product->getMarmUnitPrice()*1000}] [{oxmultilang ident="G"}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]
        [{elseif $product->oxarticles__oxunitname->value  == '_UNIT_L'}]
            [{*Gewicht von Liter in Mililiter umrechnen, wenn Liter*}]
            [{$product->getMarmUnitPrice()*1000}] [{oxmultilang ident="ML"}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]
        [{else}]
            [{$product->getMarmUnitPrice()}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]
        [{/if}]
            </span>
[{elseif $product->oxarticles__oxweight->value }]
    <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit text-nowrap">
        <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
        <span class="value">[{$product->oxarticles__oxweight->value*1000}] [{oxmultilang ident="G"}]</span>
    </span>
[{/if}]
    [{/oxhasrights}]