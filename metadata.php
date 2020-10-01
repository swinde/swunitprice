<?php
/**
 * @package       swunitprice
 * @category      module
 * @author        Steffen Winde
 * @link          http://winde-ganzig.de/
 * @licenses      GNU GENERAL PUBLIC LICENSE. More info can be found in LICENSE file.
 * @copyright (C] OXID e-Sales, 2003-2017
 */

/**
 * Metadata version
 */
$sMetadataVersion = '2.0';

/**
 * Module information
 */
$aModule = [
    'id'           => 'swinde/swunitprice',
    'title'        => '.BEES | Grundpreis für Artikel',
    'description'  => [
        'de' => 'Grundpreis für Artikel. (V6]',
        'en' => 'Grundpreis für Artikel. (V6]',
    ],
    'version'      => '1.2',
    'author'       => 'Steffen Winde',
    'url'          => 'http://winde-ganzig.de/',
    'email'        => '',
    'extend'      => [
        \OxidEsales\Eshop\Application\Model\Article::class => \Swinde\SwUnitprice\Model\SwUnitprice::class,
     ],
    'events'       => [],
    'blocks' => [
        //listitem_infogrid Gewichtanzeige in Gramm ändern
        [
            'template' => 'widget/product/listitem_infogrid.tpl',
            'block'    => 'widget_product_listitem_infogrid_price',
            'file'     => 'views/blocks/sw_unitprice_widget_product_listitem_infogrid_price.tpl'
        ],
        //listitem_infogrid Gewichtanzeige in Gramm ändern
        [
            'template' => 'widget/product/listitem_grid.tpl',
            'block'    => 'widget_product_listitem_grid_price',
            'file'     => 'views/blocks/sw_unitprice_widget_product_listitem_grid_price.tpl'
        ],
        //listitem_infogrid Gewichtanzeige in Gramm ändern
        [
            'template' => 'widget/product/listitem_line.tpl',
            'block'    => 'widget_product_listitem_line_price',
            'file'     => 'views/blocks/sw_unitprice_widget_product_listitem_line_price.tpl'
        ],
        //Detailansicht Gewichtsangabe in 100 g
        [
            'template' => 'page/details/inc/productmain.tpl',
            'block'    => 'details_productmain_weight',
            'file'     => 'views/blocks/sw_unitprice_details_productmain_weight.tpl'
        ],
        //Product Detailansicht Preis/Gewichtseinheit
        [
            'template' => 'page/details/inc/productmain.tpl',
            'block'    => 'details_productmain_priceperunit',
            'file'     => 'views/blocks/sw_unitprice_details_productmain_priceperunit.tpl'
        ],

    ],

    'settings'     => []
];
