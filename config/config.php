<?php
/*-------------------------------------------------------
*
*   Plugin "Maps"
*   Author: Vladimir Yuriev (extravert)
*   Official site: altocms.ru
*   Contact e-mail: support@lsmods.ru
*
---------------------------------------------------------
* Adopted for Alto CMS v.1.+ by aVadim
*/

$config = array();

/*
 * Настройки
 */
$config['show_blog_map']=true;//показывать ли на странице блога карту с топиками из блога.
$config['show_tag_map']=true;//показывать ли на странице тега карту с топиками по тегу.

/*
 * Карта
 */
$config['map_type']='yandex'; //yandex или google
$config['map_width']='600px';
$config['map_height']='400px';
$config['map_center']='55.75703,37.61614';//Москва
$config['map_zoom']='15';
$config['map_enablescrollzoom']= '1';
$config['map_showtoolbar']= '1';
$config['map_showtypecontrol']='1';
$config['map_showzoom']='1';

return $config;

// EOF