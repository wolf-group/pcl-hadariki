<!--{*
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
 *}-->
 <!--▼CONTENTS-->
<div id="under02column">
  <div id="under02column_error">
    <div class="messagearea">
      <!--★エラーメッセージ-->
      <!--{if $already_added_point}-->
        既に付与済みです。
      <!--{else}-->
        <!--{$click_point|number_format}-->ptが付与されました。
      <!--{/if}-->
    </div>

    <div class="tblareabtn">
    <a href="/" onmouseover="chgImg('<!--{$TPL_DIR}-->img/common/b_toppage_on.gif','b_toppage');" onmouseout="chgImg('<!--{$TPL_DIR}-->img/common/b_toppage.gif','b_toppage');"><img src="<!--{$TPL_DIR}-->img/common/b_toppage.gif" alt="トップページへ" title="トップページへ" border="0" name="b_toppage" /></a>
    </div>
  </div>
</div>
<!--▲CONTENTS-->
