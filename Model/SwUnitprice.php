<?php
/**
 * This file is part of OXID eSales PayPal module.
 *
 * OXID eSales PayPal module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales PayPal module is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OXID eSales PayPal module.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2017
 */

namespace Swinde\SwUnitprice\Model;

use OxidEsales\Eshop\Application\Model\Article;


/**
 * Grundpreisausgabe oxArticle class
 *
 * @mixin \OxidEsales\Eshop\Application\Model\Article
 */
class SwUnitprice extends Swunitprice_parent
{

    public function getMarmUnitPrice()
    {
        $dQuantity = $this->oxarticles__oxunitquantity->value;
        $sUnitName = $this->oxarticles__oxunitname->value;

        $aUnitDoubleSplit = preg_split("/[ ßöäüÖÄÜa-zA-Z]/",$sUnitName,2);
        $aUnitNameSplit = preg_split("|(\d+){1,}|",$sUnitName,2);
        {if  ($aUnitNameSplit[0] == $sUnitName) $aUnitNameSplit[1] = ' '.$this->getUnitName();}
        {if  ($aUnitDoubleSplit[0] == 0) $aUnitDoubleSplit[0] = 1;}

        $dUnit = $aUnitDoubleSplit[0]*$dQuantity;

        return $dUnit.$aUnitNameSplit[1];
    }
}