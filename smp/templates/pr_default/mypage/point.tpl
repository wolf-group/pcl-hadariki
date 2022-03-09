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
<!-- 現在のポイント ここから -->
    <!--{if $point_disp !== false}-->
        <p style="padding:5px">
            ようこそ <br />
            <!--{$CustomerName1|escape}--> <!--{$CustomerName2|escape}-->様<br />
            <!--{if $point_flg != 2}-->
                現在の所持ポイントは<em><!--{$CustomerPoint|number_format|escape|default:"0"}-->pt</em>です。
            <!--{/if}-->
        </p>
    <!--{/if}-->
<!-- 現在のポイント ここまで -->
