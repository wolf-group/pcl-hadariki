<!--{*
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
*}-->
<!--▼POINT-->
<div class="welcome">
<!--{if $point_disp !== false}-->
        ようこそ<span><!--{$CustomerName1|escape}--> <!--{$CustomerName2|escape}--></span>様
        <!--{if $point_flg != 2}--><div class="re_point">所持ポイント：<!--{$CustomerPoint|number_format|escape|default:"0"}-->pt</div><!--{/if}-->
    <!--{/if}-->
</div>
<!--▲POINT-->