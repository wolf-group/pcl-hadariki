<?xml version="1.0" encoding="<!--{$encode}-->"?>
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
<rss version="2.0">

<!--{* channel要素 *}-->
<channel>
<title> <!--{$site_title|sf_mb_convert_encoding:$encode|escape}--> </title>
<link> <!--{$smarty.const.SSL_URL}--> </link>
<description> <!--{$description|sf_mb_convert_encoding:$encode|escape}--> </description>
<language>ja</language>
<managingEditor><!--{$email|escape}--></managingEditor>
<webMaster><!--{$email|escape}--></webMaster>
<generator>web shoppings v1.0</generator>
<copyright>(c) COPYRIGHT</copyright>
<category>WEB SHOPPING</category>
<docs>http://backend.userland.com/rss</docs>
<!--{if '/nofollow/'|preg_match:$pc_front_head}-->
	<!--{$pc_front_head|smarty:nodefaults}-->
<!--{/if}-->
	<!--{section name=cnt loop=$arrNews}-->
		<!--{* １つのitem要素を出力する *}-->
		<item>
			<!--{if $arrNews[cnt].news_url == '' }-->
				<link> <!--{$smarty.const.SSL_URL}--> </link>
			<!--{else}-->
				<link> <!--{$arrNews[cnt].news_url|escape}--></link>
			<!--{/if}-->
			<title> <!--{ $arrNews[cnt].news_title|sf_mb_convert_encoding:$encode|escape }--> </title>
			<description><!--{$arrNews[cnt].news_comment|mb_strimwidth:0:40:'...':'UTF-8'|escape}--></description>
			<!--{* <pubDate><!--{"r"|sf_mktime:$arrNews[cnt].hour:$arrNews[cnt].minute:$arrNews[cnt].second:$arrNews[cnt].month:$arrNews[cnt].day:$arrNews[cnt].year}--></pubDate> *}-->
			<!--{*$timestamp|escape*}-->
			<pubDate><!--{"r"|sf_mktime:$arrNews[cnt].HOUR:$arrNews[cnt].MINUTE:$arrNews[cnt].SECOND:$arrNews[cnt].MONTH:$arrNews[cnt].DAY:$arrNews[cnt].YEAR}--></pubDate>
		</item>
	<!--{/section}-->

</channel>
</rss >
