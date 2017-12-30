[{if $oUnitPrice}]
    <span id="productPriceUnit">[{oxmultilang ident="BASICPRICE" suffix="COLON"}] [{oxprice price=$oUnitPrice currency=$currency}]/[{$oDetailsProduct->getUnitName()}]</span>
[{/if}]