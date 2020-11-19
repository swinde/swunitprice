[{oxhasrights ident="SHOWARTICLEPRICE"}]
    [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
    [{assign var="tprice"     value=$product->getTPrice()}]
    [{assign var="price"      value=$product->getPrice()}]

    [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
    <span class="oldPrice text-muted">
                                    <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                                </span>
    [{/if}]

    [{block name="widget_product_listitem_grid_price_value"}]
    [{if $product->getFPrice()}]
    <span class="lead text-nowrap">
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
                                    </span>
    [{/if}]
    [{/block}]
    [{if $oUnitPrice}]
    <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                     [{$product->getMarmUnitPrice()}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]
                                    [{* [{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()}]*}]
                                </span>
    [{elseif $product->oxarticles__oxweight->value }]
    <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                    <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
                                    <span class="value">[{$product->oxarticles__oxweight->value*1000}] [{oxmultilang ident="G"}]</span>
                                </span>
    [{/if}]
    [{/oxhasrights}]