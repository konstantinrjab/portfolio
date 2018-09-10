-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июл 13 2018 г., 17:35
-- Версия сервера: 5.7.22-0ubuntu0.16.04.1
-- Версия PHP: 7.2.7-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `clemo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clm_bwg_album`
--

CREATE TABLE `clm_bwg_album` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `preview_image` mediumtext NOT NULL,
  `random_preview_image` mediumtext NOT NULL,
  `order` bigint(20) NOT NULL,
  `author` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_bwg_album_gallery`
--

CREATE TABLE `clm_bwg_album_gallery` (
  `id` bigint(20) NOT NULL,
  `album_id` bigint(20) NOT NULL,
  `is_album` tinyint(1) NOT NULL,
  `alb_gal_id` bigint(20) NOT NULL,
  `order` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_bwg_gallery`
--

CREATE TABLE `clm_bwg_gallery` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `page_link` mediumtext NOT NULL,
  `preview_image` mediumtext NOT NULL,
  `random_preview_image` mediumtext NOT NULL,
  `order` bigint(20) NOT NULL,
  `author` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `gallery_type` varchar(32) NOT NULL,
  `gallery_source` varchar(256) NOT NULL,
  `autogallery_image_number` int(4) NOT NULL,
  `update_flag` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `clm_bwg_gallery`
--

INSERT INTO `clm_bwg_gallery` (`id`, `name`, `slug`, `description`, `page_link`, `preview_image`, `random_preview_image`, `order`, `author`, `published`, `gallery_type`, `gallery_source`, `autogallery_image_number`, `update_flag`) VALUES
(1, 'vpn', 'vpn', '<p>some description text</p>', '', '', '/thumb/hacker.jpg', 1, 1, 1, '', '', 12, '');

-- --------------------------------------------------------

--
-- Структура таблицы `clm_bwg_image`
--

CREATE TABLE `clm_bwg_image` (
  `id` bigint(20) NOT NULL,
  `gallery_id` bigint(20) NOT NULL,
  `slug` longtext NOT NULL,
  `filename` varchar(255) NOT NULL,
  `image_url` mediumtext NOT NULL,
  `thumb_url` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `alt` mediumtext NOT NULL,
  `date` varchar(128) NOT NULL,
  `size` varchar(128) NOT NULL,
  `filetype` varchar(128) NOT NULL,
  `resolution` varchar(128) NOT NULL,
  `author` bigint(20) NOT NULL,
  `order` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `comment_count` bigint(20) NOT NULL,
  `avg_rating` float NOT NULL,
  `rate_count` bigint(20) NOT NULL,
  `hit_count` bigint(20) NOT NULL,
  `redirect_url` varchar(255) NOT NULL,
  `pricelist_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `clm_bwg_image`
--

INSERT INTO `clm_bwg_image` (`id`, `gallery_id`, `slug`, `filename`, `image_url`, `thumb_url`, `description`, `alt`, `date`, `size`, `filetype`, `resolution`, `author`, `order`, `published`, `comment_count`, `avg_rating`, `rate_count`, `hit_count`, `redirect_url`, `pricelist_id`) VALUES
(1, 1, 'hacker', 'hacker', '/hacker.jpg', '/thumb/hacker.jpg', '', 'hacker', '04 December 2017, 07:50', '173 KB', 'JPG', '640 x 360 px', 1, 1, 1, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `clm_bwg_image_comment`
--

CREATE TABLE `clm_bwg_image_comment` (
  `id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` varchar(64) NOT NULL,
  `comment` mediumtext NOT NULL,
  `url` mediumtext NOT NULL,
  `mail` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_bwg_image_rate`
--

CREATE TABLE `clm_bwg_image_rate` (
  `id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `rate` float NOT NULL,
  `ip` varchar(64) NOT NULL,
  `date` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_bwg_image_tag`
--

CREATE TABLE `clm_bwg_image_tag` (
  `id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `gallery_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_bwg_shortcode`
--

CREATE TABLE `clm_bwg_shortcode` (
  `id` bigint(20) NOT NULL,
  `tagtext` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `clm_bwg_shortcode`
--

INSERT INTO `clm_bwg_shortcode` (`id`, `tagtext`) VALUES
(1, ' gallery_type="thumbnails" theme_id="1" use_option_defaults="0" gallery_id="0" sort_by="order" order_by="asc" show_search_box="0" show_sort_images="0" search_box_width="180" image_column_number="5" images_per_page="30" image_title="none" image_enable_page="1" thumb_width="180" thumb_height="90" load_more_image_count="30" show_tag_box="0" tag="0" show_gallery_description="0" showthumbs_name="0" thumb_click_action="open_lightbox" thumb_link_target="1" popup_fullscreen="0" popup_autoplay="0" popup_width="800" popup_height="500" popup_effect="fade" popup_interval="5" popup_enable_filmstrip="0" popup_filmstrip_height="70" popup_enable_ctrl_btn="1" popup_enable_fullscreen="1" popup_enable_info="1" popup_info_always_show="0" popup_info_full_width="0" popup_enable_rate="0" popup_enable_comment="1" popup_hit_counter="0" popup_enable_facebook="1" popup_enable_twitter="1" popup_enable_google="1" popup_enable_pinterest="0" popup_enable_tumblr="0" show_tag_box="0" popup_effect_duration="1" watermark_type="none" watermark_link="https://web-dorado.com"'),
(2, ' use_option_defaults="1" type="gallery" theme_id="1" gallery_id="1" tag="0" gallery_type="thumbnails"'),
(3, ' gallery_type="thumbnails" theme_id="1" use_option_defaults="0" gallery_id="1" sort_by="order" order_by="asc" show_search_box="0" show_sort_images="0" search_box_width="180" image_column_number="5" images_per_page="30" image_title="none" image_enable_page="1" thumb_width="180" thumb_height="90" load_more_image_count="30" show_tag_box="0" tag="0" show_gallery_description="0" showthumbs_name="0" thumb_click_action="open_lightbox" thumb_link_target="1" popup_fullscreen="0" popup_autoplay="0" popup_width="800" popup_height="500" popup_effect="fade" popup_interval="5" popup_enable_filmstrip="0" popup_filmstrip_height="70" popup_enable_ctrl_btn="1" popup_enable_fullscreen="1" popup_enable_info="1" popup_info_always_show="0" popup_info_full_width="0" popup_enable_rate="0" popup_enable_comment="1" popup_hit_counter="0" popup_enable_facebook="1" popup_enable_twitter="1" popup_enable_google="1" popup_enable_pinterest="0" popup_enable_tumblr="0" show_tag_box="0" popup_effect_duration="1" watermark_type="none" watermark_link="https://web-dorado.com"');

-- --------------------------------------------------------

--
-- Структура таблицы `clm_bwg_theme`
--

CREATE TABLE `clm_bwg_theme` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `options` longtext NOT NULL,
  `default_theme` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `clm_bwg_theme`
--

INSERT INTO `clm_bwg_theme` (`id`, `name`, `options`, `default_theme`) VALUES
(1, 'Theme 1', '{"thumb_margin":4,"thumb_padding":0,"thumb_border_radius":"0","thumb_border_width":0,"thumb_border_style":"none","thumb_border_color":"CCCCCC","thumb_bg_color":"FFFFFF","thumbs_bg_color":"FFFFFF","thumb_bg_transparent":0,"thumb_box_shadow":"0px 0px 0px #888888","thumb_transparent":100,"thumb_align":"center","thumb_hover_effect":"scale","thumb_hover_effect_value":"1.1","thumb_transition":1,"thumb_title_font_color":"CCCCCC","thumb_title_font_style":"segoe ui","thumb_title_pos":"bottom","thumb_title_font_size":16,"thumb_title_font_weight":"bold","thumb_title_margin":"2px","thumb_title_shadow":"0px 0px 0px #888888","thumb_gal_title_font_color":"CCCCCC","thumb_gal_title_font_style":"segoe ui","thumb_gal_title_font_size":16,"thumb_gal_title_font_weight":"bold","thumb_gal_title_margin":"2px","thumb_gal_title_shadow":"0px 0px 0px #888888","thumb_gal_title_align":"center","page_nav_position":"bottom","page_nav_align":"center","page_nav_number":0,"page_nav_font_size":12,"page_nav_font_style":"segoe ui","page_nav_font_color":"666666","page_nav_font_weight":"bold","page_nav_border_width":1,"page_nav_border_style":"solid","page_nav_border_color":"E3E3E3","page_nav_border_radius":"0","page_nav_margin":"0","page_nav_padding":"3px 6px","page_nav_button_bg_color":"FFFFFF","page_nav_button_bg_transparent":100,"page_nav_box_shadow":"0","page_nav_button_transition":1,"page_nav_button_text":0,"lightbox_overlay_bg_color":"000000","lightbox_overlay_bg_transparent":70,"lightbox_bg_color":"000000","lightbox_ctrl_btn_pos":"bottom","lightbox_ctrl_btn_align":"center","lightbox_ctrl_btn_height":20,"lightbox_ctrl_btn_margin_top":10,"lightbox_ctrl_btn_margin_left":7,"lightbox_ctrl_btn_transparent":100,"lightbox_ctrl_btn_color":"FFFFFF","lightbox_toggle_btn_height":14,"lightbox_toggle_btn_width":100,"lightbox_ctrl_cont_bg_color":"000000","lightbox_ctrl_cont_transparent":65,"lightbox_ctrl_cont_border_radius":4,"lightbox_close_btn_transparent":100,"lightbox_close_btn_bg_color":"000000","lightbox_close_btn_border_width":2,"lightbox_close_btn_border_radius":"16px","lightbox_close_btn_border_style":"none","lightbox_close_btn_border_color":"FFFFFF","lightbox_close_btn_box_shadow":"0","lightbox_close_btn_color":"FFFFFF","lightbox_close_btn_size":10,"lightbox_close_btn_width":20,"lightbox_close_btn_height":20,"lightbox_close_btn_top":"-10","lightbox_close_btn_right":"-10","lightbox_close_btn_full_color":"FFFFFF","lightbox_rl_btn_bg_color":"000000","lightbox_rl_btn_border_radius":"20px","lightbox_rl_btn_border_width":0,"lightbox_rl_btn_border_style":"none","lightbox_rl_btn_border_color":"FFFFFF","lightbox_rl_btn_box_shadow":"","lightbox_rl_btn_color":"FFFFFF","lightbox_rl_btn_height":40,"lightbox_rl_btn_width":40,"lightbox_rl_btn_size":20,"lightbox_close_rl_btn_hover_color":"CCCCCC","lightbox_comment_pos":"left","lightbox_comment_width":400,"lightbox_comment_bg_color":"000000","lightbox_comment_font_color":"CCCCCC","lightbox_comment_font_style":"segoe ui","lightbox_comment_font_size":12,"lightbox_comment_button_bg_color":"616161","lightbox_comment_button_border_color":"666666","lightbox_comment_button_border_width":1,"lightbox_comment_button_border_style":"none","lightbox_comment_button_border_radius":"3px","lightbox_comment_button_padding":"3px 10px","lightbox_comment_input_bg_color":"333333","lightbox_comment_input_border_color":"666666","lightbox_comment_input_border_width":1,"lightbox_comment_input_border_style":"none","lightbox_comment_input_border_radius":"0","lightbox_comment_input_padding":"2px","lightbox_comment_separator_width":1,"lightbox_comment_separator_style":"solid","lightbox_comment_separator_color":"383838","lightbox_comment_author_font_size":14,"lightbox_comment_date_font_size":10,"lightbox_comment_body_font_size":12,"lightbox_comment_share_button_color":"CCCCCC","lightbox_filmstrip_pos":"top","lightbox_filmstrip_rl_bg_color":"3B3B3B","lightbox_filmstrip_rl_btn_size":20,"lightbox_filmstrip_rl_btn_color":"FFFFFF","lightbox_filmstrip_thumb_margin":"0 1px","lightbox_filmstrip_thumb_border_width":1,"lightbox_filmstrip_thumb_border_style":"solid","lightbox_filmstrip_thumb_border_color":"000000","lightbox_filmstrip_thumb_border_radius":"0","lightbox_filmstrip_thumb_deactive_transparent":80,"lightbox_filmstrip_thumb_active_border_width":0,"lightbox_filmstrip_thumb_active_border_color":"FFFFFF","lightbox_rl_btn_style":"fa-chevron","lightbox_rl_btn_transparent":80,"lightbox_bg_transparent":100,"album_compact_back_font_color":"000000","album_compact_back_font_style":"segoe ui","album_compact_back_font_size":16,"album_compact_back_font_weight":"bold","album_compact_back_padding":"0","album_compact_title_font_color":"CCCCCC","album_compact_title_font_style":"segoe ui","album_compact_thumb_title_pos":"bottom","album_compact_title_font_size":16,"album_compact_title_font_weight":"bold","album_compact_title_margin":"2px","album_compact_title_shadow":"0px 0px 0px #888888","album_compact_thumb_margin":4,"album_compact_thumb_padding":0,"album_compact_thumb_border_radius":"0","album_compact_thumb_border_width":0,"album_compact_thumb_border_style":"none","album_compact_thumb_border_color":"CCCCCC","album_compact_thumb_bg_color":"FFFFFF","album_compact_thumbs_bg_color":"FFFFFF","album_compact_thumb_bg_transparent":0,"album_compact_thumb_box_shadow":"0px 0px 0px #888888","album_compact_thumb_transparent":100,"album_compact_thumb_align":"center","album_compact_thumb_hover_effect":"scale","album_compact_thumb_hover_effect_value":"1.1","album_compact_thumb_transition":0,"album_compact_gal_title_font_color":"CCCCCC","album_compact_gal_title_font_style":"segoe ui","album_compact_gal_title_font_size":16,"album_compact_gal_title_font_weight":"bold","album_compact_gal_title_margin":"2px","album_compact_gal_title_shadow":"0px 0px 0px #888888","album_compact_gal_title_align":"center","album_extended_thumb_margin":2,"album_extended_thumb_padding":0,"album_extended_thumb_border_radius":"0","album_extended_thumb_border_width":0,"album_extended_thumb_border_style":"none","album_extended_thumb_border_color":"CCCCCC","album_extended_thumb_bg_color":"FFFFFF","album_extended_thumbs_bg_color":"FFFFFF","album_extended_thumb_bg_transparent":0,"album_extended_thumb_box_shadow":"","album_extended_thumb_transparent":100,"album_extended_thumb_align":"left","album_extended_thumb_hover_effect":"scale","album_extended_thumb_hover_effect_value":"1.1","album_extended_thumb_transition":0,"album_extended_back_font_color":"000000","album_extended_back_font_style":"segoe ui","album_extended_back_font_size":20,"album_extended_back_font_weight":"bold","album_extended_back_padding":"0","album_extended_div_bg_color":"FFFFFF","album_extended_div_bg_transparent":0,"album_extended_div_border_radius":"0 0 0 0","album_extended_div_margin":"0 0 5px 0","album_extended_div_padding":10,"album_extended_div_separator_width":1,"album_extended_div_separator_style":"solid","album_extended_div_separator_color":"E0E0E0","album_extended_thumb_div_bg_color":"FFFFFF","album_extended_thumb_div_border_radius":"0","album_extended_thumb_div_border_width":1,"album_extended_thumb_div_border_style":"solid","album_extended_thumb_div_border_color":"E8E8E8","album_extended_thumb_div_padding":"5px","album_extended_text_div_bg_color":"FFFFFF","album_extended_text_div_border_radius":"0","album_extended_text_div_border_width":1,"album_extended_text_div_border_style":"solid","album_extended_text_div_border_color":"E8E8E8","album_extended_text_div_padding":"5px","album_extended_title_span_border_width":1,"album_extended_title_span_border_style":"none","album_extended_title_span_border_color":"CCCCCC","album_extended_title_font_color":"000000","album_extended_title_font_style":"segoe ui","album_extended_title_font_size":16,"album_extended_title_font_weight":"bold","album_extended_title_margin_bottom":2,"album_extended_title_padding":"2px","album_extended_desc_span_border_width":1,"album_extended_desc_span_border_style":"none","album_extended_desc_span_border_color":"CCCCCC","album_extended_desc_font_color":"000000","album_extended_desc_font_style":"segoe ui","album_extended_desc_font_size":14,"album_extended_desc_font_weight":"normal","album_extended_desc_padding":"2px","album_extended_desc_more_color":"F2D22E","album_extended_desc_more_size":12,"album_extended_gal_title_font_color":"CCCCCC","album_extended_gal_title_font_style":"segoe ui","album_extended_gal_title_font_size":16,"album_extended_gal_title_font_weight":"bold","album_extended_gal_title_margin":"2px","album_extended_gal_title_shadow":"0px 0px 0px #888888","album_extended_gal_title_align":"center","masonry_thumb_padding":4,"masonry_thumb_border_radius":"0","masonry_thumb_border_width":0,"masonry_thumb_border_style":"none","masonry_thumb_border_color":"CCCCCC","masonry_thumbs_bg_color":"FFFFFF","masonry_thumb_bg_transparent":0,"masonry_thumb_transparent":100,"masonry_thumb_align":"center","masonry_thumb_hover_effect":"scale","masonry_thumb_hover_effect_value":"1.1","masonry_thumb_transition":0,"masonry_thumb_gal_title_font_color":"CCCCCC","masonry_thumb_gal_title_font_style":"segoe ui","masonry_thumb_gal_title_font_size":16,"masonry_thumb_gal_title_font_weight":"bold","masonry_thumb_gal_title_margin":"2px","masonry_thumb_gal_title_shadow":"0px 0px 0px #888888","masonry_thumb_gal_title_align":"center","slideshow_cont_bg_color":"000000","slideshow_close_btn_transparent":100,"slideshow_rl_btn_bg_color":"000000","slideshow_rl_btn_border_radius":"20px","slideshow_rl_btn_border_width":0,"slideshow_rl_btn_border_style":"none","slideshow_rl_btn_border_color":"FFFFFF","slideshow_rl_btn_box_shadow":"0px 0px 0px #000000","slideshow_rl_btn_color":"FFFFFF","slideshow_rl_btn_height":40,"slideshow_rl_btn_size":20,"slideshow_rl_btn_width":40,"slideshow_close_rl_btn_hover_color":"CCCCCC","slideshow_filmstrip_pos":"top","slideshow_filmstrip_thumb_border_width":1,"slideshow_filmstrip_thumb_border_style":"solid","slideshow_filmstrip_thumb_border_color":"000000","slideshow_filmstrip_thumb_border_radius":"0","slideshow_filmstrip_thumb_margin":"0 1px","slideshow_filmstrip_thumb_active_border_width":0,"slideshow_filmstrip_thumb_active_border_color":"FFFFFF","slideshow_filmstrip_thumb_deactive_transparent":80,"slideshow_filmstrip_rl_bg_color":"3B3B3B","slideshow_filmstrip_rl_btn_color":"FFFFFF","slideshow_filmstrip_rl_btn_size":20,"slideshow_title_font_size":16,"slideshow_title_font":"segoe ui","slideshow_title_color":"FFFFFF","slideshow_title_opacity":70,"slideshow_title_border_radius":"5px","slideshow_title_background_color":"000000","slideshow_title_padding":"0 0 0 0","slideshow_description_font_size":14,"slideshow_description_font":"segoe ui","slideshow_description_color":"FFFFFF","slideshow_description_opacity":70,"slideshow_description_border_radius":"0","slideshow_description_background_color":"000000","slideshow_description_padding":"5px 10px 5px 10px","slideshow_dots_width":12,"slideshow_dots_height":12,"slideshow_dots_border_radius":"5px","slideshow_dots_background_color":"F2D22E","slideshow_dots_margin":3,"slideshow_dots_active_background_color":"FFFFFF","slideshow_dots_active_border_width":1,"slideshow_dots_active_border_color":"000000","slideshow_play_pause_btn_size":60,"slideshow_rl_btn_style":"fa-chevron","blog_style_margin":"2px","blog_style_padding":"0","blog_style_border_radius":"0","blog_style_border_width":1,"blog_style_border_style":"solid","blog_style_border_color":"F5F5F5","blog_style_bg_color":"FFFFFF","blog_style_transparent":80,"blog_style_box_shadow":"","blog_style_align":"center","blog_style_share_buttons_margin":"5px auto 10px auto","blog_style_share_buttons_border_radius":"0","blog_style_share_buttons_border_width":0,"blog_style_share_buttons_border_style":"none","blog_style_share_buttons_border_color":"000000","blog_style_share_buttons_bg_color":"FFFFFF","blog_style_share_buttons_align":"right","blog_style_img_font_size":16,"blog_style_img_font_family":"segoe ui","blog_style_img_font_color":"000000","blog_style_share_buttons_color":"B3AFAF","blog_style_share_buttons_bg_transparent":0,"blog_style_share_buttons_font_size":20,"blog_style_gal_title_font_color":"CCCCCC","blog_style_gal_title_font_style":"segoe ui","blog_style_gal_title_font_size":16,"blog_style_gal_title_font_weight":"bold","blog_style_gal_title_margin":"2px","blog_style_gal_title_shadow":"0px 0px 0px #888888","blog_style_gal_title_align":"center","image_browser_margin":"2px auto","image_browser_padding":"4px","image_browser_border_radius":"0","image_browser_border_width":1,"image_browser_border_style":"none","image_browser_border_color":"F5F5F5","image_browser_bg_color":"EBEBEB","image_browser_box_shadow":"","image_browser_transparent":80,"image_browser_align":"center","image_browser_image_description_margin":"0px 5px 0px 5px","image_browser_image_description_padding":"8px 8px 8px 8px","image_browser_image_description_border_radius":"0","image_browser_image_description_border_width":1,"image_browser_image_description_border_style":"none","image_browser_image_description_border_color":"FFFFFF","image_browser_image_description_bg_color":"EBEBEB","image_browser_image_description_align":"center","image_browser_img_font_size":15,"image_browser_img_font_family":"segoe ui","image_browser_img_font_color":"000000","image_browser_full_padding":"4px","image_browser_full_border_radius":"0","image_browser_full_border_width":2,"image_browser_full_border_style":"none","image_browser_full_border_color":"F7F7F7","image_browser_full_bg_color":"F5F5F5","image_browser_full_transparent":90,"image_browser_image_title_align":"top","image_browser_gal_title_font_color":"CCCCCC","image_browser_gal_title_font_style":"segoe ui","image_browser_gal_title_font_size":16,"image_browser_gal_title_font_weight":"bold","image_browser_gal_title_margin":"2px","image_browser_gal_title_shadow":"0px 0px 0px #888888","image_browser_gal_title_align":"center","lightbox_info_pos":"top","lightbox_info_align":"right","lightbox_info_bg_color":"000000","lightbox_info_bg_transparent":70,"lightbox_info_border_width":1,"lightbox_info_border_style":"none","lightbox_info_border_color":"000000","lightbox_info_border_radius":"5px","lightbox_info_padding":"5px","lightbox_info_margin":"15px","lightbox_title_color":"FFFFFF","lightbox_title_font_style":"segoe ui","lightbox_title_font_weight":"bold","lightbox_title_font_size":18,"lightbox_description_color":"FFFFFF","lightbox_description_font_style":"segoe ui","lightbox_description_font_weight":"normal","lightbox_description_font_size":14,"lightbox_rate_pos":"bottom","lightbox_rate_align":"right","lightbox_rate_icon":"star","lightbox_rate_color":"F9D062","lightbox_rate_size":20,"lightbox_rate_stars_count":5,"lightbox_rate_padding":"15px","lightbox_rate_hover_color":"F7B50E","lightbox_hit_pos":"bottom","lightbox_hit_align":"left","lightbox_hit_bg_color":"000000","lightbox_hit_bg_transparent":70,"lightbox_hit_border_width":1,"lightbox_hit_border_style":"none","lightbox_hit_border_color":"000000","lightbox_hit_border_radius":"5px","lightbox_hit_padding":"5px","lightbox_hit_margin":"0 5px","lightbox_hit_color":"FFFFFF","lightbox_hit_font_style":"segoe ui","lightbox_hit_font_weight":"normal","lightbox_hit_font_size":14,"masonry_description_font_size":12,"masonry_description_color":"CCCCCC","masonry_description_font_style":"segoe ui","album_masonry_back_font_color":"000000","album_masonry_back_font_style":"segoe ui","album_masonry_back_font_size":16,"album_masonry_back_font_weight":"bold","album_masonry_back_padding":"0","album_masonry_title_font_color":"CCCCCC","album_masonry_title_font_style":"segoe ui","album_masonry_thumb_title_pos":"bottom","album_masonry_title_font_size":16,"album_masonry_title_font_weight":"bold","album_masonry_title_margin":"2px","album_masonry_title_shadow":"0px 0px 0px #888888","album_masonry_thumb_margin":4,"album_masonry_thumb_padding":0,"album_masonry_thumb_border_radius":"0","album_masonry_thumb_border_width":0,"album_masonry_thumb_border_style":"none","album_masonry_thumb_border_color":"CCCCCC","album_masonry_thumb_bg_color":"FFFFFF","album_masonry_thumbs_bg_color":"FFFFFF","album_masonry_thumb_bg_transparent":0,"album_masonry_thumb_box_shadow":"0px 0px 0px #888888","album_masonry_thumb_transparent":100,"album_masonry_thumb_align":"center","album_masonry_thumb_hover_effect":"scale","album_masonry_thumb_hover_effect_value":"1.1","album_masonry_thumb_transition":0,"album_masonry_gal_title_font_color":"CCCCCC","album_masonry_gal_title_font_style":"segoe ui","album_masonry_gal_title_font_size":16,"album_masonry_gal_title_font_weight":"bold","album_masonry_gal_title_margin":"2px","album_masonry_gal_title_shadow":"0px 0px 0px #888888","album_masonry_gal_title_align":"center","mosaic_thumb_padding":4,"mosaic_thumb_border_radius":"0","mosaic_thumb_border_width":0,"mosaic_thumb_border_style":"none","mosaic_thumb_border_color":"CCCCCC","mosaic_thumbs_bg_color":"FFFFFF","mosaic_thumb_bg_transparent":0,"mosaic_thumb_transparent":100,"mosaic_thumb_align":"center","mosaic_thumb_hover_effect":"scale","mosaic_thumb_hover_effect_value":"1.1","mosaic_thumb_title_font_color":"CCCCCC","mosaic_thumb_title_font_style":"segoe ui","mosaic_thumb_title_font_weight":"bold","mosaic_thumb_title_margin":"2px","mosaic_thumb_title_shadow":"0px 0px 0px #888888","mosaic_thumb_title_font_size":16,"mosaic_thumb_gal_title_font_color":"CCCCCC","mosaic_thumb_gal_title_font_style":"segoe ui","mosaic_thumb_gal_title_font_size":16,"mosaic_thumb_gal_title_font_weight":"bold","mosaic_thumb_gal_title_margin":"2px","mosaic_thumb_gal_title_shadow":"0px 0px 0px #888888","mosaic_thumb_gal_title_align":"center","carousel_cont_bg_color":"000000","carousel_cont_btn_transparent":0,"carousel_close_btn_transparent":100,"carousel_rl_btn_bg_color":"000000","carousel_rl_btn_border_radius":"20px","carousel_rl_btn_border_width":0,"carousel_rl_btn_border_style":"none","carousel_rl_btn_border_color":"FFFFFF","carousel_rl_btn_color":"FFFFFF","carousel_rl_btn_height":40,"carousel_rl_btn_size":20,"carousel_play_pause_btn_size":20,"carousel_rl_btn_width":40,"carousel_close_rl_btn_hover_color":"CCCCCC","carousel_rl_btn_style":"fa-chevron","carousel_mergin_bottom":"0.5","carousel_font_family":"segoe ui","carousel_feature_border_width":2,"carousel_feature_border_style":"solid","carousel_feature_border_color":"5D204F","carousel_caption_background_color":"000000","carousel_caption_bottom":0,"carousel_caption_p_mergin":0,"carousel_caption_p_pedding":5,"carousel_caption_p_font_weight":"bold","carousel_caption_p_font_size":14,"carousel_caption_p_color":"white","carousel_title_opacity":100,"carousel_title_border_radius":"5px","mosaic_thumb_transition":1}', 1),
(2, 'Theme 2', '{"thumb_margin":4,"thumb_padding":4,"thumb_border_radius":"0","thumb_border_width":5,"thumb_border_style":"none","thumb_border_color":"FFFFFF","thumb_bg_color":"E8E8E8","thumbs_bg_color":"FFFFFF","thumb_bg_transparent":0,"thumb_box_shadow":"0px 0px 0px #888888","thumb_transparent":100,"thumb_align":"center","thumb_hover_effect":"rotate","thumb_hover_effect_value":"2deg","thumb_transition":1,"thumb_title_font_color":"CCCCCC","thumb_title_font_style":"segoe ui","thumb_title_pos":"bottom","thumb_title_font_size":16,"thumb_title_font_weight":"bold","thumb_title_margin":"5px","thumb_title_shadow":"","thumb_gal_title_font_color":"CCCCCC","thumb_gal_title_font_style":"segoe ui","thumb_gal_title_font_size":16,"thumb_gal_title_font_weight":"bold","thumb_gal_title_margin":"2px","thumb_gal_title_shadow":"0px 0px 0px #888888","thumb_gal_title_align":"center","page_nav_position":"bottom","page_nav_align":"center","page_nav_number":0,"page_nav_font_size":12,"page_nav_font_style":"segoe ui","page_nav_font_color":"666666","page_nav_font_weight":"bold","page_nav_border_width":1,"page_nav_border_style":"none","page_nav_border_color":"E3E3E3","page_nav_border_radius":"0","page_nav_margin":"0","page_nav_padding":"3px 6px","page_nav_button_bg_color":"FCFCFC","page_nav_button_bg_transparent":100,"page_nav_box_shadow":"0","page_nav_button_transition":1,"page_nav_button_text":0,"lightbox_overlay_bg_color":"000000","lightbox_overlay_bg_transparent":70,"lightbox_bg_color":"000000","lightbox_ctrl_btn_pos":"bottom","lightbox_ctrl_btn_align":"center","lightbox_ctrl_btn_height":20,"lightbox_ctrl_btn_margin_top":10,"lightbox_ctrl_btn_margin_left":7,"lightbox_ctrl_btn_transparent":80,"lightbox_ctrl_btn_color":"FFFFFF","lightbox_toggle_btn_height":14,"lightbox_toggle_btn_width":100,"lightbox_ctrl_cont_bg_color":"000000","lightbox_ctrl_cont_transparent":80,"lightbox_ctrl_cont_border_radius":4,"lightbox_close_btn_transparent":95,"lightbox_close_btn_bg_color":"000000","lightbox_close_btn_border_width":0,"lightbox_close_btn_border_radius":"16px","lightbox_close_btn_border_style":"none","lightbox_close_btn_border_color":"FFFFFF","lightbox_close_btn_box_shadow":"","lightbox_close_btn_color":"FFFFFF","lightbox_close_btn_size":10,"lightbox_close_btn_width":20,"lightbox_close_btn_height":20,"lightbox_close_btn_top":"-10","lightbox_close_btn_right":"-10","lightbox_close_btn_full_color":"FFFFFF","lightbox_rl_btn_bg_color":"000000","lightbox_rl_btn_border_radius":"20px","lightbox_rl_btn_border_width":2,"lightbox_rl_btn_border_style":"none","lightbox_rl_btn_border_color":"FFFFFF","lightbox_rl_btn_box_shadow":"","lightbox_rl_btn_color":"FFFFFF","lightbox_rl_btn_height":40,"lightbox_rl_btn_width":40,"lightbox_rl_btn_size":20,"lightbox_close_rl_btn_hover_color":"FFFFFF","lightbox_comment_pos":"left","lightbox_comment_width":400,"lightbox_comment_bg_color":"000000","lightbox_comment_font_color":"CCCCCC","lightbox_comment_font_style":"segoe ui","lightbox_comment_font_size":12,"lightbox_comment_button_bg_color":"333333","lightbox_comment_button_border_color":"666666","lightbox_comment_button_border_width":1,"lightbox_comment_button_border_style":"none","lightbox_comment_button_border_radius":"3px","lightbox_comment_button_padding":"3px 10px","lightbox_comment_input_bg_color":"333333","lightbox_comment_input_border_color":"666666","lightbox_comment_input_border_width":1,"lightbox_comment_input_border_style":"none","lightbox_comment_input_border_radius":"0","lightbox_comment_input_padding":"3px","lightbox_comment_separator_width":1,"lightbox_comment_separator_style":"solid","lightbox_comment_separator_color":"2B2B2B","lightbox_comment_author_font_size":14,"lightbox_comment_date_font_size":10,"lightbox_comment_body_font_size":12,"lightbox_comment_share_button_color":"FFFFFF","lightbox_filmstrip_pos":"top","lightbox_filmstrip_rl_bg_color":"2B2B2B","lightbox_filmstrip_rl_btn_size":20,"lightbox_filmstrip_rl_btn_color":"FFFFFF","lightbox_filmstrip_thumb_margin":"0 1px","lightbox_filmstrip_thumb_border_width":1,"lightbox_filmstrip_thumb_border_style":"none","lightbox_filmstrip_thumb_border_color":"000000","lightbox_filmstrip_thumb_border_radius":"0","lightbox_filmstrip_thumb_deactive_transparent":80,"lightbox_filmstrip_thumb_active_border_width":0,"lightbox_filmstrip_thumb_active_border_color":"FFFFFF","lightbox_rl_btn_style":"fa-chevron","lightbox_rl_btn_transparent":80,"lightbox_bg_transparent":100,"album_compact_back_font_color":"000000","album_compact_back_font_style":"segoe ui","album_compact_back_font_size":14,"album_compact_back_font_weight":"normal","album_compact_back_padding":"0","album_compact_title_font_color":"CCCCCC","album_compact_title_font_style":"segoe ui","album_compact_thumb_title_pos":"bottom","album_compact_title_font_size":16,"album_compact_title_font_weight":"bold","album_compact_title_margin":"5px","album_compact_title_shadow":"","album_compact_thumb_margin":4,"album_compact_thumb_padding":4,"album_compact_thumb_border_radius":"0","album_compact_thumb_border_width":1,"album_compact_thumb_border_style":"none","album_compact_thumb_border_color":"000000","album_compact_thumb_bg_color":"E8E8E8","album_compact_thumbs_bg_color":"FFFFFF","album_compact_thumb_bg_transparent":100,"album_compact_thumb_box_shadow":"","album_compact_thumb_transparent":100,"album_compact_thumb_align":"center","album_compact_thumb_hover_effect":"rotate","album_compact_thumb_hover_effect_value":"2deg","album_compact_thumb_transition":1,"album_compact_gal_title_font_color":"CCCCCC","album_compact_gal_title_font_style":"segoe ui","album_compact_gal_title_font_size":16,"album_compact_gal_title_font_weight":"bold","album_compact_gal_title_margin":"2px","album_compact_gal_title_shadow":"0px 0px 0px #888888","album_compact_gal_title_align":"center","album_extended_thumb_margin":2,"album_extended_thumb_padding":4,"album_extended_thumb_border_radius":"0","album_extended_thumb_border_width":4,"album_extended_thumb_border_style":"none","album_extended_thumb_border_color":"E8E8E8","album_extended_thumb_bg_color":"E8E8E8","album_extended_thumbs_bg_color":"FFFFFF","album_extended_thumb_bg_transparent":100,"album_extended_thumb_box_shadow":"","album_extended_thumb_transparent":100,"album_extended_thumb_align":"left","album_extended_thumb_hover_effect":"rotate","album_extended_thumb_hover_effect_value":"2deg","album_extended_thumb_transition":0,"album_extended_back_font_color":"000000","album_extended_back_font_style":"segoe ui","album_extended_back_font_size":16,"album_extended_back_font_weight":"bold","album_extended_back_padding":"0","album_extended_div_bg_color":"FFFFFF","album_extended_div_bg_transparent":0,"album_extended_div_border_radius":"0","album_extended_div_margin":"0 0 5px 0","album_extended_div_padding":10,"album_extended_div_separator_width":1,"album_extended_div_separator_style":"none","album_extended_div_separator_color":"CCCCCC","album_extended_thumb_div_bg_color":"FFFFFF","album_extended_thumb_div_border_radius":"0","album_extended_thumb_div_border_width":0,"album_extended_thumb_div_border_style":"none","album_extended_thumb_div_border_color":"CCCCCC","album_extended_thumb_div_padding":"0","album_extended_text_div_bg_color":"FFFFFF","album_extended_text_div_border_radius":"0","album_extended_text_div_border_width":1,"album_extended_text_div_border_style":"none","album_extended_text_div_border_color":"CCCCCC","album_extended_text_div_padding":"5px","album_extended_title_span_border_width":1,"album_extended_title_span_border_style":"none","album_extended_title_span_border_color":"CCCCCC","album_extended_title_font_color":"000000","album_extended_title_font_style":"segoe ui","album_extended_title_font_size":16,"album_extended_title_font_weight":"bold","album_extended_title_margin_bottom":2,"album_extended_title_padding":"2px","album_extended_desc_span_border_width":1,"album_extended_desc_span_border_style":"none","album_extended_desc_span_border_color":"CCCCCC","album_extended_desc_font_color":"000000","album_extended_desc_font_style":"segoe ui","album_extended_desc_font_size":14,"album_extended_desc_font_weight":"normal","album_extended_desc_padding":"2px","album_extended_desc_more_color":"FFC933","album_extended_desc_more_size":12,"album_extended_gal_title_font_color":"CCCCCC","album_extended_gal_title_font_style":"segoe ui","album_extended_gal_title_font_size":16,"album_extended_gal_title_font_weight":"bold","album_extended_gal_title_margin":"2px","album_extended_gal_title_shadow":"0px 0px 0px #888888","album_extended_gal_title_align":"center","masonry_thumb_padding":4,"masonry_thumb_border_radius":"2px","masonry_thumb_border_width":1,"masonry_thumb_border_style":"none","masonry_thumb_border_color":"CCCCCC","masonry_thumbs_bg_color":"FFFFFF","masonry_thumb_bg_transparent":0,"masonry_thumb_transparent":80,"masonry_thumb_align":"center","masonry_thumb_hover_effect":"rotate","masonry_thumb_hover_effect_value":"2deg","masonry_thumb_transition":0,"masonry_thumb_gal_title_font_color":"CCCCCC","masonry_thumb_gal_title_font_style":"segoe ui","masonry_thumb_gal_title_font_size":16,"masonry_thumb_gal_title_font_weight":"bold","masonry_thumb_gal_title_margin":"2px","masonry_thumb_gal_title_shadow":"0px 0px 0px #888888","masonry_thumb_gal_title_align":"center","slideshow_cont_bg_color":"000000","slideshow_close_btn_transparent":100,"slideshow_rl_btn_bg_color":"000000","slideshow_rl_btn_border_radius":"20px","slideshow_rl_btn_border_width":0,"slideshow_rl_btn_border_style":"none","slideshow_rl_btn_border_color":"FFFFFF","slideshow_rl_btn_box_shadow":"","slideshow_rl_btn_color":"FFFFFF","slideshow_rl_btn_height":40,"slideshow_rl_btn_size":20,"slideshow_rl_btn_width":40,"slideshow_close_rl_btn_hover_color":"DBDBDB","slideshow_filmstrip_pos":"bottom","slideshow_filmstrip_thumb_border_width":1,"slideshow_filmstrip_thumb_border_style":"none","slideshow_filmstrip_thumb_border_color":"000000","slideshow_filmstrip_thumb_border_radius":"0","slideshow_filmstrip_thumb_margin":"0 1px","slideshow_filmstrip_thumb_active_border_width":0,"slideshow_filmstrip_thumb_active_border_color":"FFFFFF","slideshow_filmstrip_thumb_deactive_transparent":80,"slideshow_filmstrip_rl_bg_color":"303030","slideshow_filmstrip_rl_btn_color":"FFFFFF","slideshow_filmstrip_rl_btn_size":20,"slideshow_title_font_size":16,"slideshow_title_font":"segoe ui","slideshow_title_color":"FFFFFF","slideshow_title_opacity":70,"slideshow_title_border_radius":"5px","slideshow_title_background_color":"000000","slideshow_title_padding":"5px 10px 5px 10px","slideshow_description_font_size":14,"slideshow_description_font":"segoe ui","slideshow_description_color":"FFFFFF","slideshow_description_opacity":70,"slideshow_description_border_radius":"0","slideshow_description_background_color":"000000","slideshow_description_padding":"5px 10px 5px 10px","slideshow_dots_width":10,"slideshow_dots_height":10,"slideshow_dots_border_radius":"10px","slideshow_dots_background_color":"292929","slideshow_dots_margin":1,"slideshow_dots_active_background_color":"292929","slideshow_dots_active_border_width":2,"slideshow_dots_active_border_color":"FFC933","slideshow_play_pause_btn_size":60,"slideshow_rl_btn_style":"fa-chevron","blog_style_margin":"2px","blog_style_padding":"4px","blog_style_border_radius":"0","blog_style_border_width":1,"blog_style_border_style":"none","blog_style_border_color":"CCCCCC","blog_style_bg_color":"E8E8E8","blog_style_transparent":70,"blog_style_box_shadow":"","blog_style_align":"center","blog_style_share_buttons_margin":"5px auto 10px auto","blog_style_share_buttons_border_radius":"0","blog_style_share_buttons_border_width":0,"blog_style_share_buttons_border_style":"none","blog_style_share_buttons_border_color":"000000","blog_style_share_buttons_bg_color":"FFFFFF","blog_style_share_buttons_align":"right","blog_style_img_font_size":16,"blog_style_img_font_family":"segoe ui","blog_style_img_font_color":"000000","blog_style_share_buttons_color":"A1A1A1","blog_style_share_buttons_bg_transparent":0,"blog_style_share_buttons_font_size":20,"blog_style_image_title_align":"top","blog_style_gal_title_font_color":"CCCCCC","blog_style_gal_title_font_style":"segoe ui","blog_style_gal_title_font_size":16,"blog_style_gal_title_font_weight":"bold","blog_style_gal_title_margin":"2px","blog_style_gal_title_shadow":"0px 0px 0px #888888","blog_style_gal_title_align":"center","image_browser_margin":"2px auto","image_browser_padding":"4px","image_browser_border_radius":"2px","image_browser_border_width":1,"image_browser_border_style":"none","image_browser_border_color":"E8E8E8","image_browser_bg_color":"E8E8E8","image_browser_box_shadow":"","image_browser_transparent":80,"image_browser_align":"center","image_browser_image_description_margin":"24px 0px 0px 0px","image_browser_image_description_padding":"8px 8px 8px 8px","image_browser_image_description_border_radius":"0","image_browser_image_description_border_width":1,"image_browser_image_description_border_style":"none","image_browser_image_description_border_color":"FFFFFF","image_browser_image_description_bg_color":"E8E8E8","image_browser_image_description_align":"center","image_browser_img_font_size":14,"image_browser_img_font_family":"segoe ui","image_browser_img_font_color":"000000","image_browser_full_padding":"4px","image_browser_full_border_radius":"0","image_browser_full_border_width":1,"image_browser_full_border_style":"solid","image_browser_full_border_color":"EDEDED","image_browser_full_bg_color":"FFFFFF","image_browser_full_transparent":90,"image_browser_image_title_align":"top","image_browser_gal_title_font_color":"CCCCCC","image_browser_gal_title_font_style":"segoe ui","image_browser_gal_title_font_size":16,"image_browser_gal_title_font_weight":"bold","image_browser_gal_title_margin":"2px","image_browser_gal_title_shadow":"0px 0px 0px #888888","image_browser_gal_title_align":"center","lightbox_info_pos":"top","lightbox_info_align":"right","lightbox_info_bg_color":"000000","lightbox_info_bg_transparent":70,"lightbox_info_border_width":1,"lightbox_info_border_style":"none","lightbox_info_border_color":"000000","lightbox_info_border_radius":"5px","lightbox_info_padding":"5px","lightbox_info_margin":"15px","lightbox_title_color":"FFFFFF","lightbox_title_font_style":"segoe ui","lightbox_title_font_weight":"bold","lightbox_title_font_size":18,"lightbox_description_color":"FFFFFF","lightbox_description_font_style":"segoe ui","lightbox_description_font_weight":"normal","lightbox_description_font_size":14,"lightbox_rate_pos":"bottom","lightbox_rate_align":"right","lightbox_rate_icon":"star","lightbox_rate_color":"F9D062","lightbox_rate_size":20,"lightbox_rate_stars_count":5,"lightbox_rate_padding":"15px","lightbox_rate_hover_color":"F7B50E","lightbox_hit_pos":"bottom","lightbox_hit_align":"left","lightbox_hit_bg_color":"000000","lightbox_hit_bg_transparent":70,"lightbox_hit_border_width":1,"lightbox_hit_border_style":"none","lightbox_hit_border_color":"000000","lightbox_hit_border_radius":"5px","lightbox_hit_padding":"5px","lightbox_hit_margin":"0 5px","lightbox_hit_color":"FFFFFF","lightbox_hit_font_style":"segoe ui","lightbox_hit_font_weight":"normal","lightbox_hit_font_size":14,"masonry_description_font_size":12,"masonry_description_color":"CCCCCC","masonry_description_font_style":"segoe ui","album_masonry_back_font_color":"000000","album_masonry_back_font_style":"segoe ui","album_masonry_back_font_size":14,"album_masonry_back_font_weight":"normal","album_masonry_back_padding":"0","album_masonry_title_font_color":"CCCCCC","album_masonry_title_font_style":"segoe ui","album_masonry_thumb_title_pos":"bottom","album_masonry_title_font_size":16,"album_masonry_title_font_weight":"bold","album_masonry_title_margin":"5px","album_masonry_title_shadow":"","album_masonry_thumb_margin":4,"album_masonry_thumb_padding":4,"album_masonry_thumb_border_radius":"0","album_masonry_thumb_border_width":1,"album_masonry_thumb_border_style":"none","album_masonry_thumb_border_color":"000000","album_masonry_thumb_bg_color":"E8E8E8","album_masonry_thumbs_bg_color":"FFFFFF","album_masonry_thumb_bg_transparent":100,"album_masonry_thumb_box_shadow":"","album_masonry_thumb_transparent":100,"album_masonry_thumb_align":"center","album_masonry_thumb_hover_effect":"rotate","album_masonry_thumb_hover_effect_value":"2deg","album_masonry_thumb_transition":1,"album_masonry_gal_title_font_color":"CCCCCC","album_masonry_gal_title_font_style":"segoe ui","album_masonry_gal_title_font_size":16,"album_masonry_gal_title_font_weight":"bold","album_masonry_gal_title_margin":"2px","album_masonry_gal_title_shadow":"0px 0px 0px #888888","album_masonry_gal_title_align":"center","mosaic_thumb_padding":4,"mosaic_thumb_border_radius":"2px","mosaic_thumb_border_width":1,"mosaic_thumb_border_style":"none","mosaic_thumb_border_color":"CCCCCC","mosaic_thumbs_bg_color":"FFFFFF","mosaic_thumb_bg_transparent":0,"mosaic_thumb_transparent":80,"mosaic_thumb_align":"center","mosaic_thumb_hover_effect":"rotate","mosaic_thumb_hover_effect_value":"2deg","mosaic_thumb_title_font_color":"CCCCCC","mosaic_thumb_title_font_style":"segoe ui","mosaic_thumb_title_font_weight":"bold","mosaic_thumb_title_margin":"2px","mosaic_thumb_title_shadow":"0px 0px 0px #888888","mosaic_thumb_title_font_size":16,"mosaic_thumb_gal_title_font_color":"CCCCCC","mosaic_thumb_gal_title_font_style":"segoe ui","mosaic_thumb_gal_title_font_size":16,"mosaic_thumb_gal_title_font_weight":"bold","mosaic_thumb_gal_title_margin":"2px","mosaic_thumb_gal_title_shadow":"0px 0px 0px #888888","mosaic_thumb_gal_title_align":"center","carousel_cont_bg_color":"000000","carousel_cont_btn_transparent":0,"carousel_close_btn_transparent":100,"carousel_rl_btn_bg_color":"000000","carousel_rl_btn_border_radius":"20px","carousel_rl_btn_border_width":0,"carousel_rl_btn_border_style":"none","carousel_rl_btn_border_color":"FFFFFF","carousel_rl_btn_color":"FFFFFF","carousel_rl_btn_height":40,"carousel_rl_btn_size":20,"carousel_play_pause_btn_size":20,"carousel_rl_btn_width":40,"carousel_close_rl_btn_hover_color":"CCCCCC","carousel_rl_btn_style":"fa-chevron","carousel_mergin_bottom":"0.5","carousel_font_family":"segoe ui","carousel_feature_border_width":2,"carousel_feature_border_style":"solid","carousel_feature_border_color":"5D204F","carousel_caption_background_color":"000000","carousel_caption_bottom":0,"carousel_caption_p_mergin":0,"carousel_caption_p_pedding":5,"carousel_caption_p_font_weight":"bold","carousel_caption_p_font_size":14,"carousel_caption_p_color":"white","carousel_title_opacity":100,"carousel_title_border_radius":"5px","mosaic_thumb_transition":1}', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `clm_commentmeta`
--

CREATE TABLE `clm_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_comments`
--

CREATE TABLE `clm_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clm_comments`
--

INSERT INTO `clm_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2017-12-02 10:45:32', '2017-12-02 10:45:32', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0),
(2, 1, 'clemo_admin', 'krforgames@gmail.com', '', '127.0.0.1', '2017-12-10 21:09:06', '2017-12-10 21:09:06', 'reply', 0, '1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '', 1, 1),
(3, 201, 'clemo_admin', 'krforgames@gmail.com', '', '176.36.53.31', '2018-05-30 11:45:09', '2018-05-30 11:45:09', 'duck', 0, '1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `clm_links`
--

CREATE TABLE `clm_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_ngg_album`
--

CREATE TABLE `clm_ngg_album` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `albumdesc` mediumtext,
  `sortorder` longtext NOT NULL,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_ngg_gallery`
--

CREATE TABLE `clm_ngg_gallery` (
  `gid` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `path` mediumtext,
  `title` mediumtext,
  `galdesc` mediumtext,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `author` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_ngg_pictures`
--

CREATE TABLE `clm_ngg_pictures` (
  `pid` bigint(20) NOT NULL,
  `image_slug` varchar(255) NOT NULL,
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `galleryid` bigint(20) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `description` mediumtext,
  `alttext` mediumtext,
  `imagedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exclude` tinyint(4) DEFAULT '0',
  `sortorder` bigint(20) NOT NULL DEFAULT '0',
  `meta_data` longtext,
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_options`
--

CREATE TABLE `clm_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clm_options`
--

INSERT INTO `clm_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://178.128.44.139/wordpress/', 'yes'),
(2, 'home', 'http://178.128.44.139/wordpress/', 'yes'),
(3, 'blogname', 'clemo', 'yes'),
(4, 'blogdescription', 'create your own event', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'krforgames@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:257:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:35:"bwg_tag/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"bwg_tag/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"bwg_tag/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"bwg_tag/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"bwg_tag/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"bwg_tag/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"bwg_tag/([^/]+)/embed/?$";s:40:"index.php?bwg_tag=$matches[1]&embed=true";s:28:"bwg_tag/([^/]+)/trackback/?$";s:34:"index.php?bwg_tag=$matches[1]&tb=1";s:36:"bwg_tag/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?bwg_tag=$matches[1]&paged=$matches[2]";s:43:"bwg_tag/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?bwg_tag=$matches[1]&cpage=$matches[2]";s:32:"bwg_tag/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?bwg_tag=$matches[1]&page=$matches[2]";s:24:"bwg_tag/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"bwg_tag/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"bwg_tag/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"bwg_tag/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"bwg_tag/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"bwg_tag/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:41:"carousel_team/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:51:"carousel_team/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:71:"carousel_team/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"carousel_team/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"carousel_team/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:47:"carousel_team/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:30:"carousel_team/([^/]+)/embed/?$";s:46:"index.php?carousel_team=$matches[1]&embed=true";s:34:"carousel_team/([^/]+)/trackback/?$";s:40:"index.php?carousel_team=$matches[1]&tb=1";s:42:"carousel_team/([^/]+)/page/?([0-9]{1,})/?$";s:53:"index.php?carousel_team=$matches[1]&paged=$matches[2]";s:49:"carousel_team/([^/]+)/comment-page-([0-9]{1,})/?$";s:53:"index.php?carousel_team=$matches[1]&cpage=$matches[2]";s:38:"carousel_team/([^/]+)(?:/([0-9]+))?/?$";s:52:"index.php?carousel_team=$matches[1]&page=$matches[2]";s:30:"carousel_team/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:40:"carousel_team/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:60:"carousel_team/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"carousel_team/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"carousel_team/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:36:"carousel_team/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"reviews/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"reviews/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"reviews/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"reviews/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"reviews/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"reviews/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"reviews/([^/]+)/embed/?$";s:40:"index.php?reviews=$matches[1]&embed=true";s:28:"reviews/([^/]+)/trackback/?$";s:34:"index.php?reviews=$matches[1]&tb=1";s:36:"reviews/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?reviews=$matches[1]&paged=$matches[2]";s:43:"reviews/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?reviews=$matches[1]&cpage=$matches[2]";s:32:"reviews/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?reviews=$matches[1]&page=$matches[2]";s:24:"reviews/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"reviews/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"reviews/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"reviews/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"reviews/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"reviews/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"skills/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"skills/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"skills/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"skills/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"skills/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"skills/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:23:"skills/([^/]+)/embed/?$";s:39:"index.php?skills=$matches[1]&embed=true";s:27:"skills/([^/]+)/trackback/?$";s:33:"index.php?skills=$matches[1]&tb=1";s:35:"skills/([^/]+)/page/?([0-9]{1,})/?$";s:46:"index.php?skills=$matches[1]&paged=$matches[2]";s:42:"skills/([^/]+)/comment-page-([0-9]{1,})/?$";s:46:"index.php?skills=$matches[1]&cpage=$matches[2]";s:31:"skills/([^/]+)(?:/([0-9]+))?/?$";s:45:"index.php?skills=$matches[1]&page=$matches[2]";s:23:"skills/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:33:"skills/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:53:"skills/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"skills/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"skills/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:29:"skills/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"service/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"service/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"service/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"service/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"service/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"service/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"service/([^/]+)/embed/?$";s:40:"index.php?service=$matches[1]&embed=true";s:28:"service/([^/]+)/trackback/?$";s:34:"index.php?service=$matches[1]&tb=1";s:36:"service/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?service=$matches[1]&paged=$matches[2]";s:43:"service/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?service=$matches[1]&cpage=$matches[2]";s:32:"service/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?service=$matches[1]&page=$matches[2]";s:24:"service/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"service/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"service/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"service/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"service/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"service/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"contact/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"contact/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"contact/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"contact/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"contact/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"contact/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"contact/([^/]+)/embed/?$";s:40:"index.php?contact=$matches[1]&embed=true";s:28:"contact/([^/]+)/trackback/?$";s:34:"index.php?contact=$matches[1]&tb=1";s:36:"contact/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?contact=$matches[1]&paged=$matches[2]";s:43:"contact/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?contact=$matches[1]&cpage=$matches[2]";s:32:"contact/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?contact=$matches[1]&page=$matches[2]";s:24:"contact/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"contact/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"contact/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"contact/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"contact/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"contact/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:32:"work/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"work/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:62:"work/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"work/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"work/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"work/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:21:"work/([^/]+)/embed/?$";s:37:"index.php?work=$matches[1]&embed=true";s:25:"work/([^/]+)/trackback/?$";s:31:"index.php?work=$matches[1]&tb=1";s:33:"work/([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?work=$matches[1]&paged=$matches[2]";s:40:"work/([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?work=$matches[1]&cpage=$matches[2]";s:29:"work/([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?work=$matches[1]&page=$matches[2]";s:21:"work/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:31:"work/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:51:"work/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"work/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"work/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:27:"work/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:39:"bwg_gallery/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:49:"bwg_gallery/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:69:"bwg_gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"bwg_gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"bwg_gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:45:"bwg_gallery/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:28:"bwg_gallery/([^/]+)/embed/?$";s:44:"index.php?bwg_gallery=$matches[1]&embed=true";s:32:"bwg_gallery/([^/]+)/trackback/?$";s:38:"index.php?bwg_gallery=$matches[1]&tb=1";s:40:"bwg_gallery/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?bwg_gallery=$matches[1]&paged=$matches[2]";s:47:"bwg_gallery/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?bwg_gallery=$matches[1]&cpage=$matches[2]";s:36:"bwg_gallery/([^/]+)(?:/([0-9]+))?/?$";s:50:"index.php?bwg_gallery=$matches[1]&page=$matches[2]";s:28:"bwg_gallery/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:38:"bwg_gallery/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:58:"bwg_gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"bwg_gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"bwg_gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:34:"bwg_gallery/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:37:"bwg_album/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"bwg_album/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"bwg_album/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"bwg_album/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"bwg_album/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"bwg_album/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"bwg_album/([^/]+)/embed/?$";s:42:"index.php?bwg_album=$matches[1]&embed=true";s:30:"bwg_album/([^/]+)/trackback/?$";s:36:"index.php?bwg_album=$matches[1]&tb=1";s:38:"bwg_album/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?bwg_album=$matches[1]&paged=$matches[2]";s:45:"bwg_album/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?bwg_album=$matches[1]&cpage=$matches[2]";s:34:"bwg_album/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?bwg_album=$matches[1]&page=$matches[2]";s:26:"bwg_album/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"bwg_album/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"bwg_album/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"bwg_album/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"bwg_album/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"bwg_album/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:36:"amn_smtp/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"amn_smtp/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"amn_smtp/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"amn_smtp/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"amn_smtp/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"amn_smtp/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:25:"amn_smtp/([^/]+)/embed/?$";s:41:"index.php?amn_smtp=$matches[1]&embed=true";s:29:"amn_smtp/([^/]+)/trackback/?$";s:35:"index.php?amn_smtp=$matches[1]&tb=1";s:37:"amn_smtp/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?amn_smtp=$matches[1]&paged=$matches[2]";s:44:"amn_smtp/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?amn_smtp=$matches[1]&cpage=$matches[2]";s:33:"amn_smtp/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?amn_smtp=$matches[1]&page=$matches[2]";s:25:"amn_smtp/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:"amn_smtp/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:55:"amn_smtp/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"amn_smtp/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"amn_smtp/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"amn_smtp/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:38:"index.php?&page_id=5&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:5:{i:0;s:34:"advanced-custom-fields-pro/acf.php";i:1;s:36:"contact-form-7/wp-contact-form-7.php";i:2;s:43:"custom-post-type-ui/custom-post-type-ui.php";i:3;s:31:"photo-gallery/photo-gallery.php";i:4;s:29:"wp-mail-smtp/wp_mail_smtp.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:4:{i:0;s:57:"/var/www/html/wordpress/wp-content/themes/clemo/style.css";i:2;s:52:"/var/www/html/wordpress/wp-content/plugins/hello.php";i:3;s:62:"/var/www/html/wordpress/wp-content/plugins/akismet/akismet.php";i:4;s:0:"";}', 'no'),
(40, 'template', 'clemo', 'yes'),
(41, 'stylesheet', 'clemo', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '7', 'yes'),
(84, 'page_on_front', '5', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '179', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'clm_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:64:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:10:"copy_posts";b:1;s:19:"NextGEN Manage tags";b:1;s:29:"NextGEN Manage others gallery";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:35:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:10:"copy_posts";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'cron', 'a:5:{i:1530632814;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1530657933;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1530701149;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1530701378;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(110, 'theme_mods_twentyseventeen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1512211712;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(122, 'can_compress_scripts', '1', 'no'),
(137, 'current_theme', 'clemo', 'yes'),
(138, 'theme_mods_clemo', 'a:6:{i:0;b:0;s:18:"nav_menu_locations";a:3:{s:4:"main";i:0;s:9:"Main Menu";i:4;s:6:"menu-1";i:4;}s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1512211743;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}s:16:"header_textcolor";s:6:"000000";s:11:"custom_logo";i:186;}', 'yes'),
(139, 'theme_switched', '', 'yes'),
(146, 'recently_activated', 'a:0:{}', 'yes'),
(153, 'acf_version', '5.3.9.2', 'yes'),
(156, 'cptui_new_install', 'false', 'yes'),
(157, 'cptui_post_types', 'a:6:{s:13:"carousel_team";a:28:{s:4:"name";s:13:"carousel_team";s:5:"label";s:4:"Team";s:14:"singular_label";s:6:"Member";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:18:"publicly_queryable";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:23:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:10:"view_items";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:17:"parent_item_colon";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";s:10:"attributes";s:0:"";}s:15:"custom_supports";s:0:"";}s:7:"reviews";a:28:{s:4:"name";s:7:"reviews";s:5:"label";s:7:"Reviews";s:14:"singular_label";s:6:"Review";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:18:"publicly_queryable";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:23:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:10:"view_items";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:17:"parent_item_colon";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";s:10:"attributes";s:0:"";}s:15:"custom_supports";s:0:"";}s:6:"skills";a:28:{s:4:"name";s:6:"skills";s:5:"label";s:6:"Skills";s:14:"singular_label";s:5:"Skill";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:18:"publicly_queryable";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:23:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:10:"view_items";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:17:"parent_item_colon";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";s:10:"attributes";s:0:"";}s:15:"custom_supports";s:0:"";}s:7:"service";a:28:{s:4:"name";s:7:"service";s:5:"label";s:8:"Services";s:14:"singular_label";s:7:"Service";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:18:"publicly_queryable";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:23:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:10:"view_items";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:17:"parent_item_colon";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";s:10:"attributes";s:0:"";}s:15:"custom_supports";s:0:"";}s:7:"contact";a:28:{s:4:"name";s:7:"contact";s:5:"label";s:8:"Contacts";s:14:"singular_label";s:7:"Contact";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:18:"publicly_queryable";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:23:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:10:"view_items";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:17:"parent_item_colon";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";s:10:"attributes";s:0:"";}s:15:"custom_supports";s:0:"";}s:4:"work";a:28:{s:4:"name";s:4:"work";s:5:"label";s:5:"Works";s:14:"singular_label";s:4:"Work";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:18:"publicly_queryable";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:23:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:10:"view_items";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:17:"parent_item_colon";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";s:10:"attributes";s:0:"";}s:15:"custom_supports";s:0:"";}}', 'yes'),
(178, 'WPLANG', '', 'yes'),
(179, 'new_admin_email', 'krforgames@gmail.com', 'yes'),
(201, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:1:{i:0;i:4;}}', 'yes'),
(226, 'duplicate_post_copytitle', '1', 'yes'),
(227, 'duplicate_post_copydate', '0', 'yes'),
(228, 'duplicate_post_copystatus', '0', 'yes'),
(229, 'duplicate_post_copyslug', '1', 'yes'),
(230, 'duplicate_post_copyexcerpt', '1', 'yes'),
(231, 'duplicate_post_copycontent', '1', 'yes'),
(232, 'duplicate_post_copythumbnail', '1', 'yes'),
(233, 'duplicate_post_copytemplate', '1', 'yes'),
(234, 'duplicate_post_copyformat', '1', 'yes'),
(235, 'duplicate_post_copyauthor', '0', 'yes'),
(236, 'duplicate_post_copypassword', '0', 'yes'),
(237, 'duplicate_post_copyattachments', '0', 'yes'),
(238, 'duplicate_post_copychildren', '0', 'yes'),
(239, 'duplicate_post_copycomments', '0', 'yes'),
(240, 'duplicate_post_copymenuorder', '1', 'yes'),
(241, 'duplicate_post_taxonomies_blacklist', 'a:0:{}', 'yes'),
(242, 'duplicate_post_blacklist', '', 'yes'),
(243, 'duplicate_post_types_enabled', 'a:2:{i:0;s:4:"post";i:1;s:4:"page";}', 'yes'),
(244, 'duplicate_post_show_row', '1', 'yes'),
(245, 'duplicate_post_show_adminbar', '1', 'yes'),
(246, 'duplicate_post_show_submitbox', '1', 'yes'),
(247, 'duplicate_post_show_bulkactions', '1', 'yes'),
(248, 'duplicate_post_version', '3.2.1', 'yes'),
(249, 'duplicate_post_show_notice', '0', 'no'),
(256, 'ngg_run_freemius', '1', 'yes'),
(257, 'fs_active_plugins', 'O:8:"stdClass":2:{s:7:"plugins";a:1:{s:24:"nextgen-gallery/freemius";O:8:"stdClass":3:{s:7:"version";s:7:"1.2.1.5";s:9:"timestamp";i:1512373234;s:11:"plugin_path";s:29:"nextgen-gallery/nggallery.php";}}s:6:"newest";O:8:"stdClass":5:{s:11:"plugin_path";s:29:"nextgen-gallery/nggallery.php";s:8:"sdk_path";s:24:"nextgen-gallery/freemius";s:7:"version";s:7:"1.2.1.5";s:13:"in_activation";b:1;s:9:"timestamp";i:1512373234;}}', 'yes'),
(258, 'fs_debug_mode', '', 'yes');
INSERT INTO `clm_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(259, 'fs_accounts', 'a:11:{s:11:"plugin_data";a:1:{s:15:"nextgen-gallery";a:18:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:80:"C:/OpenServer/domains/wordpress/wp-content/plugins/nextgen-gallery/nggallery.php";}s:17:"install_timestamp";i:1512341332;s:16:"sdk_last_version";N;s:11:"sdk_version";s:7:"1.2.1.5";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:6:"2.2.16";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:21:"is_plugin_new_install";b:1;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:9:"wordpress";s:9:"server_ip";s:9:"127.0.0.1";s:9:"is_active";b:1;s:9:"timestamp";i:1512341332;s:7:"version";s:6:"2.2.16";}s:17:"was_plugin_loaded";b:1;s:15:"prev_is_premium";b:0;s:14:"has_trial_plan";b:1;s:22:"install_sync_timestamp";i:1512373235;s:20:"activation_timestamp";i:1512341338;s:14:"sync_timestamp";i:1512373068;}}s:13:"file_slug_map";a:1:{s:29:"nextgen-gallery/nggallery.php";s:15:"nextgen-gallery";}s:7:"plugins";a:1:{s:15:"nextgen-gallery";O:9:"FS_Plugin":16:{s:16:"parent_plugin_id";N;s:5:"title";s:15:"NextGEN Gallery";s:4:"slug";s:15:"nextgen-gallery";s:4:"type";N;s:4:"file";s:29:"nextgen-gallery/nggallery.php";s:7:"version";s:6:"2.2.16";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:0;s:7:"is_live";b:1;s:10:"public_key";s:32:"pk_009356711cd548837f074e1ef60a4";s:10:"secret_key";N;s:2:"id";s:3:"266";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;}}s:9:"unique_id";s:32:"83885f9a36bb695dd4ada51b41b63d3b";s:5:"plans";a:1:{s:15:"nextgen-gallery";a:1:{i:0;O:14:"FS_Plugin_Plan":21:{s:9:"plugin_id";s:4:"MjY2";s:4:"name";s:8:"ZnJlZQ==";s:5:"title";s:8:"RnJlZQ==";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:4:"MQ==";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";N;s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:0:"";s:2:"id";s:4:"Mzc0";s:7:"updated";N;s:7:"created";s:28:"MjAxNi0wNC0yNCAxNToyNzo0Nw==";s:22:"\0FS_Entity\0_is_updated";b:0;}}}s:5:"sites";a:1:{s:15:"nextgen-gallery";O:7:"FS_Site":24:{s:4:"slug";N;s:7:"site_id";s:7:"3001289";s:9:"plugin_id";s:3:"266";s:7:"user_id";s:6:"830017";s:5:"title";s:5:"clemo";s:3:"url";s:16:"http://wordpress";s:7:"version";s:6:"2.2.16";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:5:"4.9.1";s:11:"sdk_version";s:7:"1.2.1.5";s:28:"programming_language_version";s:6:"5.3.29";s:4:"plan";O:14:"FS_Plugin_Plan":21:{s:9:"plugin_id";s:4:"MjY2";s:4:"name";s:8:"ZnJlZQ==";s:5:"title";s:8:"RnJlZQ==";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:4:"MQ==";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";N;s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:0:"";s:2:"id";s:4:"Mzc0";s:7:"updated";N;s:7:"created";s:28:"MjAxNi0wNC0yNCAxNToyNzo0Nw==";s:22:"\0FS_Entity\0_is_updated";b:0;}s:10:"license_id";N;s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:10:"is_premium";b:0;s:15:"is_disconnected";b:0;s:10:"public_key";s:32:"pk_33469ba7aa585b2a2e179b93fad85";s:10:"secret_key";s:32:"sk_=HBGWI46-AMq<m?gr[9W}.ssE~msP";s:2:"id";s:7:"1059149";s:7:"updated";s:19:"2017-12-04 07:40:17";s:7:"created";s:19:"2017-12-03 22:48:44";s:22:"\0FS_Entity\0_is_updated";b:0;}}s:11:"all_plugins";O:8:"stdClass":3:{s:9:"timestamp";i:1512373068;s:3:"md5";s:32:"969f343a33f60a5a310732eb4f143a02";s:7:"plugins";a:6:{s:34:"advanced-custom-fields-pro/acf.php";a:5:{s:4:"slug";s:26:"advanced-custom-fields-pro";s:7:"version";s:7:"5.3.9.2";s:5:"title";s:26:"Advanced Custom Fields PRO";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}s:19:"akismet/akismet.php";a:5:{s:4:"slug";s:7:"akismet";s:7:"version";s:5:"4.0.1";s:5:"title";s:17:"Akismet Anti-Spam";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:43:"custom-post-type-ui/custom-post-type-ui.php";a:5:{s:4:"slug";s:19:"custom-post-type-ui";s:7:"version";s:5:"1.5.6";s:5:"title";s:19:"Custom Post Type UI";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}s:33:"duplicate-post/duplicate-post.php";a:5:{s:4:"slug";s:14:"duplicate-post";s:7:"version";s:5:"3.2.1";s:5:"title";s:14:"Duplicate Post";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}s:9:"hello.php";a:5:{s:4:"slug";s:11:"hello-dolly";s:7:"version";s:3:"1.6";s:5:"title";s:11:"Hello Dolly";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:29:"nextgen-gallery/nggallery.php";a:5:{s:4:"slug";s:15:"nextgen-gallery";s:7:"version";s:6:"2.2.16";s:5:"title";s:15:"NextGEN Gallery";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}}}s:10:"all_themes";O:8:"stdClass":3:{s:9:"timestamp";i:1512373068;s:3:"md5";s:32:"1ae1feeee7591879547dbf9aa06b84eb";s:6:"themes";a:1:{s:5:"clemo";a:5:{s:4:"slug";s:5:"clemo";s:7:"version";s:5:"1.0.0";s:5:"title";s:5:"clemo";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}}}s:5:"users";a:1:{i:830017;O:7:"FS_User":12:{s:5:"email";s:20:"krforgames@gmail.com";s:5:"first";s:11:"clemo_admin";s:4:"last";s:0:"";s:11:"is_verified";b:0;s:11:"customer_id";N;s:5:"gross";i:0;s:10:"public_key";s:32:"pk_8c7bf2cc7ee6f211e6971350a46f7";s:10:"secret_key";s:32:"sk_j^4bqR*WzZPYbtN2g<&xOqC^~D8v?";s:2:"id";s:6:"830017";s:7:"updated";N;s:7:"created";s:19:"2017-12-03 22:48:44";s:22:"\0FS_Entity\0_is_updated";b:0;}}s:8:"licenses";a:1:{s:15:"nextgen-gallery";a:1:{i:830017;b:0;}}s:13:"admin_notices";a:1:{s:15:"nextgen-gallery";a:0:{}}}', 'yes'),
(260, 'ngg_transient_groups', 'a:7:{s:9:"__counter";i:7;s:16:"col_in_clm_posts";a:2:{s:2:"id";i:2;s:7:"enabled";b:1;}s:22:"col_in_clm_ngg_gallery";a:2:{s:2:"id";i:3;s:7:"enabled";b:1;}s:3:"MVC";a:2:{s:2:"id";i:4;s:7:"enabled";b:1;}s:20:"col_in_clm_ngg_album";a:2:{s:2:"id";i:5;s:7:"enabled";b:1;}s:23:"col_in_clm_ngg_pictures";a:2:{s:2:"id";i:6;s:7:"enabled";b:1;}s:27:"displayed_gallery_rendering";a:2:{s:2:"id";i:7;s:7:"enabled";b:1;}}', 'yes'),
(265, 'fs_api_cache', 'a:0:{}', 'yes'),
(267, 'widget_ngg-images', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(268, 'widget_ngg-mrssw', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(269, 'widget_slideshow', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(270, 'ngg_options', 'a:73:{s:11:"gallerypath";s:19:"wp-content\\gallery\\";s:11:"wpmuCSSfile";s:13:"nggallery.css";s:9:"wpmuStyle";b:0;s:9:"wpmuRoles";b:0;s:16:"wpmuImportFolder";b:0;s:13:"wpmuZipUpload";b:0;s:14:"wpmuQuotaCheck";b:0;s:17:"datamapper_driver";s:22:"custom_post_datamapper";s:21:"gallerystorage_driver";s:25:"ngglegacy_gallery_storage";s:20:"maximum_entity_count";i:500;s:17:"router_param_slug";s:9:"nggallery";s:22:"router_param_separator";s:2:"--";s:19:"router_param_prefix";s:0:"";s:9:"deleteImg";b:1;s:9:"swfUpload";b:1;s:13:"usePermalinks";b:0;s:13:"permalinkSlug";s:9:"nggallery";s:14:"graphicLibrary";s:2:"gd";s:14:"imageMagickDir";s:15:"/usr/local/bin/";s:11:"useMediaRSS";b:0;s:18:"galleries_in_feeds";b:0;s:12:"activateTags";i:0;s:10:"appendType";s:4:"tags";s:9:"maxImages";i:7;s:14:"relatedHeading";s:24:"<h3>Related Images:</h3>";s:10:"thumbwidth";i:240;s:11:"thumbheight";i:160;s:8:"thumbfix";b:1;s:12:"thumbquality";i:100;s:8:"imgWidth";i:800;s:9:"imgHeight";i:600;s:10:"imgQuality";i:100;s:9:"imgBackup";b:1;s:13:"imgAutoResize";b:0;s:9:"galImages";s:2:"20";s:17:"galPagedGalleries";i:0;s:10:"galColumns";i:0;s:12:"galShowSlide";b:1;s:12:"galTextSlide";s:16:"[Show slideshow]";s:14:"galTextGallery";s:17:"[Show thumbnails]";s:12:"galShowOrder";s:7:"gallery";s:7:"galSort";s:9:"sortorder";s:10:"galSortDir";s:3:"ASC";s:10:"galNoPages";b:1;s:13:"galImgBrowser";i:0;s:12:"galHiddenImg";i:0;s:10:"galAjaxNav";i:0;s:11:"thumbEffect";s:8:"fancybox";s:9:"thumbCode";s:41:"class="ngg-fancybox" rel="%GALLERY_NAME%"";s:18:"thumbEffectContext";s:14:"nextgen_images";s:5:"wmPos";s:8:"botRight";s:6:"wmXpos";i:5;s:6:"wmYpos";i:5;s:6:"wmType";s:5:"image";s:6:"wmPath";s:0:"";s:6:"wmFont";s:9:"arial.ttf";s:6:"wmSize";i:10;s:6:"wmText";s:5:"clemo";s:7:"wmColor";s:6:"000000";s:8:"wmOpaque";s:3:"100";s:7:"slideFX";s:4:"fade";s:7:"irWidth";i:600;s:8:"irHeight";i:400;s:12:"irRotatetime";i:10;s:11:"activateCSS";i:1;s:7:"CSSfile";s:13:"nggallery.css";s:28:"always_enable_frontend_logic";b:0;s:22:"dynamic_thumbnail_slug";s:13:"nextgen-image";s:23:"dynamic_stylesheet_slug";s:12:"nextgen-dcss";s:11:"installDate";i:1512341341;s:13:"gallery_count";i:0;s:23:"dismissed_notifications";a:1:{s:48:"ngg_wizard_nextgen.beginner.gallery_creation_igw";a:1:{i:0;i:1;}}s:40:"gallery_created_after_reviews_introduced";b:1;}', 'yes'),
(272, 'photocrati_auto_update_admin_update_list', '', 'yes'),
(273, 'photocrati_auto_update_admin_check_date', '', 'yes'),
(274, 'ngg_db_version', '1.8.1', 'yes'),
(277, 'pope_module_list', 'a:1:{i:20;s:33:"photocrati-dynamic_stylesheet|0.4";}', 'yes'),
(362, 'wd_bwg_version', '1.3.64', 'no'),
(363, 'wd_bwg_theme_version', '1.0.0', 'no'),
(364, 'widget_bwp_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(365, 'widget_bwp_gallery_slideshow', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(366, 'bwg_admin_notice', 'a:1:{s:15:"two_week_review";a:2:{s:5:"start";s:10:"12/18/2017";s:3:"int";i:14;}}', 'yes'),
(367, 'bwg_subscribe_done', '1', 'yes'),
(368, 'wds_io_notice_status', '1', 'no'),
(452, 'category_children', 'a:0:{}', 'yes'),
(503, 'ftp_credentials', 'a:3:{s:8:"hostname";s:13:"139.59.164.52";s:8:"username";s:4:"root";s:15:"connection_type";s:3:"ftp";}', 'yes'),
(506, 'wpcf7', 'a:2:{s:7:"version";s:5:"5.0.2";s:13:"bulk_validate";a:4:{s:9:"timestamp";i:1527676467;s:7:"version";s:5:"5.0.2";s:11:"count_valid";i:1;s:13:"count_invalid";i:0;}}', 'yes'),
(511, 'wp_mail_smtp_version', '1.2.5', 'yes'),
(512, 'wp_mail_smtp', 'a:5:{s:4:"mail";a:4:{s:10:"from_email";s:20:"krforgames@gmail.com";s:9:"from_name";s:5:"clemo";s:6:"mailer";s:4:"smtp";s:11:"return_path";b:0;}s:4:"smtp";a:7:{s:7:"autotls";b:1;s:4:"host";s:17:"in-v3.mailjet.com";s:4:"port";i:465;s:10:"encryption";s:3:"ssl";s:4:"user";s:32:"1bfc879e3b06004ff0e681ffedb60489";s:4:"pass";s:32:"f8d4dcedd436b2b8f6a9cc2d3071544b";s:4:"auth";b:1;}s:5:"gmail";a:2:{s:9:"client_id";s:0:"";s:13:"client_secret";s:0:"";}s:7:"mailgun";a:2:{s:7:"api_key";s:0:"";s:6:"domain";s:0:"";}s:8:"sendgrid";a:1:{s:7:"api_key";s:0:"";}}', 'no'),
(513, '_amn_smtp_last_checked', '1530057600', 'yes'),
(514, 'wp_mail_smtp_debug', 'a:0:{}', 'no'),
(518, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.6.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.6.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.9.6-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.9.6-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.9.6";s:7:"version";s:5:"4.9.6";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1530617730;s:15:"version_checked";s:5:"4.9.6";s:12:"translations";a:0:{}}', 'no'),
(520, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:20:"krforgames@gmail.com";s:7:"version";s:5:"4.9.6";s:9:"timestamp";i:1527677138;}', 'no'),
(625, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1530617731;s:7:"checked";a:3:{s:4:"cket";s:5:"1.0.2";s:5:"clemo";s:5:"1.0.0";s:4:"sket";s:5:"1.0.2";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(654, '_site_transient_timeout_browser_c3b2cd67c05b47d5dd6a430f6f1cd6ff', '1530626925', 'no'),
(655, '_site_transient_browser_c3b2cd67c05b47d5dd6a430f6f1cd6ff', 'a:10:{s:4:"name";s:8:"Chromium";s:7:"version";s:13:"66.0.3359.181";s:8:"platform";s:5:"Linux";s:10:"update_url";s:0:"";s:7:"img_src";s:0:"";s:11:"img_src_ssl";s:0:"";s:15:"current_version";s:0:"";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(734, '_transient_timeout_acf_get_remote_plugin_info', '1530704131', 'no'),
(735, '_transient_acf_get_remote_plugin_info', 'a:13:{s:4:"name";s:26:"Advanced Custom Fields PRO";s:4:"slug";s:26:"advanced-custom-fields-pro";s:8:"homepage";s:37:"https://www.advancedcustomfields.com/";s:7:"version";s:6:"5.6.10";s:6:"author";s:13:"Elliot Condon";s:10:"author_url";s:28:"http://www.elliotcondon.com/";s:12:"contributors";s:12:"elliotcondon";s:8:"requires";s:5:"3.6.0";s:6:"tested";s:5:"4.9.9";s:6:"tagged";s:61:"acf, advanced, custom, field, fields, form, repeater, content";s:9:"changelog";s:67:"<h4>5.6.10</h4><ul><li>Core: Minor fixes and improvements</li></ul>";s:14:"upgrade_notice";s:0:"";s:5:"icons";a:1:{s:7:"default";s:63:"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png";}}', 'no'),
(736, '_site_transient_timeout_theme_roots', '1530619531', 'no'),
(737, '_site_transient_theme_roots', 'a:3:{s:4:"cket";s:7:"/themes";s:5:"clemo";s:7:"/themes";s:4:"sket";s:7:"/themes";}', 'no'),
(738, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1530617732;s:7:"checked";a:8:{s:34:"advanced-custom-fields-pro/acf.php";s:7:"5.3.9.2";s:19:"akismet/akismet.php";s:5:"4.0.1";s:36:"contact-form-7/wp-contact-form-7.php";s:5:"5.0.2";s:43:"custom-post-type-ui/custom-post-type-ui.php";s:5:"1.5.6";s:33:"duplicate-post/duplicate-post.php";s:5:"3.2.1";s:9:"hello.php";s:3:"1.6";s:31:"photo-gallery/photo-gallery.php";s:6:"1.3.64";s:29:"wp-mail-smtp/wp_mail_smtp.php";s:5:"1.2.5";}s:8:"response";a:6:{s:19:"akismet/akismet.php";O:8:"stdClass":12:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.0.8";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:5:"4.9.6";s:12:"requires_php";b:0;s:13:"compatibility";O:8:"stdClass":0:{}}s:43:"custom-post-type-ui/custom-post-type-ui.php";O:8:"stdClass":12:{s:2:"id";s:33:"w.org/plugins/custom-post-type-ui";s:4:"slug";s:19:"custom-post-type-ui";s:6:"plugin";s:43:"custom-post-type-ui/custom-post-type-ui.php";s:11:"new_version";s:5:"1.5.8";s:3:"url";s:50:"https://wordpress.org/plugins/custom-post-type-ui/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/custom-post-type-ui.1.5.8.zip";s:5:"icons";a:2:{s:2:"2x";s:72:"https://ps.w.org/custom-post-type-ui/assets/icon-256x256.png?rev=1069557";s:2:"1x";s:72:"https://ps.w.org/custom-post-type-ui/assets/icon-128x128.png?rev=1069557";}s:7:"banners";a:2:{s:2:"2x";s:75:"https://ps.w.org/custom-post-type-ui/assets/banner-1544x500.png?rev=1069557";s:2:"1x";s:74:"https://ps.w.org/custom-post-type-ui/assets/banner-772x250.png?rev=1069557";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:5:"4.9.5";s:12:"requires_php";s:3:"5.2";s:13:"compatibility";O:8:"stdClass":0:{}}s:33:"duplicate-post/duplicate-post.php";O:8:"stdClass":13:{s:2:"id";s:28:"w.org/plugins/duplicate-post";s:4:"slug";s:14:"duplicate-post";s:6:"plugin";s:33:"duplicate-post/duplicate-post.php";s:11:"new_version";s:5:"3.2.2";s:3:"url";s:45:"https://wordpress.org/plugins/duplicate-post/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/duplicate-post.3.2.2.zip";s:5:"icons";a:2:{s:2:"2x";s:67:"https://ps.w.org/duplicate-post/assets/icon-256x256.png?rev=1612753";s:2:"1x";s:67:"https://ps.w.org/duplicate-post/assets/icon-128x128.png?rev=1612753";}s:7:"banners";a:1:{s:2:"1x";s:69:"https://ps.w.org/duplicate-post/assets/banner-772x250.png?rev=1612986";}s:11:"banners_rtl";a:0:{}s:14:"upgrade_notice";s:90:"<p>Adds compatibility with Gutenberg UI and fixes a problem with slugs on new installs</p>";s:6:"tested";s:5:"4.9.5";s:12:"requires_php";s:5:"5.2.4";s:13:"compatibility";O:8:"stdClass":0:{}}s:31:"photo-gallery/photo-gallery.php";O:8:"stdClass":12:{s:2:"id";s:27:"w.org/plugins/photo-gallery";s:4:"slug";s:13:"photo-gallery";s:6:"plugin";s:31:"photo-gallery/photo-gallery.php";s:11:"new_version";s:6:"1.4.13";s:3:"url";s:44:"https://wordpress.org/plugins/photo-gallery/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/photo-gallery.1.4.13.zip";s:5:"icons";a:1:{s:2:"1x";s:66:"https://ps.w.org/photo-gallery/assets/icon-128x128.png?rev=1508783";}s:7:"banners";a:1:{s:2:"1x";s:68:"https://ps.w.org/photo-gallery/assets/banner-772x250.jpg?rev=1505235";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:5:"4.9.6";s:12:"requires_php";b:0;s:13:"compatibility";O:8:"stdClass":0:{}}s:29:"wp-mail-smtp/wp_mail_smtp.php";O:8:"stdClass":12:{s:2:"id";s:26:"w.org/plugins/wp-mail-smtp";s:4:"slug";s:12:"wp-mail-smtp";s:6:"plugin";s:29:"wp-mail-smtp/wp_mail_smtp.php";s:11:"new_version";s:5:"1.3.2";s:3:"url";s:43:"https://wordpress.org/plugins/wp-mail-smtp/";s:7:"package";s:55:"https://downloads.wordpress.org/plugin/wp-mail-smtp.zip";s:5:"icons";a:2:{s:2:"2x";s:65:"https://ps.w.org/wp-mail-smtp/assets/icon-256x256.png?rev=1755440";s:2:"1x";s:65:"https://ps.w.org/wp-mail-smtp/assets/icon-128x128.png?rev=1755440";}s:7:"banners";a:2:{s:2:"2x";s:68:"https://ps.w.org/wp-mail-smtp/assets/banner-1544x500.png?rev=1900656";s:2:"1x";s:67:"https://ps.w.org/wp-mail-smtp/assets/banner-772x250.png?rev=1900656";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:5:"4.9.6";s:12:"requires_php";s:3:"5.3";s:13:"compatibility";O:8:"stdClass":0:{}}s:34:"advanced-custom-fields-pro/acf.php";O:8:"stdClass":5:{s:4:"slug";s:26:"advanced-custom-fields-pro";s:6:"plugin";s:34:"advanced-custom-fields-pro/acf.php";s:11:"new_version";s:6:"5.6.10";s:3:"url";s:37:"https://www.advancedcustomfields.com/";s:7:"package";s:0:"";}}s:12:"translations";a:0:{}s:9:"no_update";a:2:{s:36:"contact-form-7/wp-contact-form-7.php";O:8:"stdClass":9:{s:2:"id";s:28:"w.org/plugins/contact-form-7";s:4:"slug";s:14:"contact-form-7";s:6:"plugin";s:36:"contact-form-7/wp-contact-form-7.php";s:11:"new_version";s:5:"5.0.2";s:3:"url";s:45:"https://wordpress.org/plugins/contact-form-7/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/contact-form-7.5.0.2.zip";s:5:"icons";a:2:{s:2:"2x";s:66:"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=984007";s:2:"1x";s:66:"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=984007";}s:7:"banners";a:2:{s:2:"2x";s:69:"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901";s:2:"1x";s:68:"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:2:{s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";}s:7:"banners";a:1:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `clm_postmeta`
--

CREATE TABLE `clm_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clm_postmeta`
--

INSERT INTO `clm_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(5, 5, '_edit_last', '1'),
(6, 5, '_wp_page_template', 'page-home.php'),
(7, 5, '_edit_lock', '1527682278:1'),
(8, 7, '_edit_last', '1'),
(9, 7, '_wp_page_template', 'default'),
(10, 7, '_edit_lock', '1512735082:1'),
(13, 10, '_edit_last', '1'),
(14, 10, '_edit_lock', '1513078366:1'),
(15, 17, '_edit_last', '1'),
(16, 17, '_wp_page_template', 'page-contacts.php'),
(17, 17, '_edit_lock', '1527679547:1'),
(18, 19, '_edit_last', '1'),
(19, 19, '_wp_page_template', 'page-services.php'),
(20, 19, '_edit_lock', '1513091469:1'),
(21, 22, 'contact_title', 'get in touch'),
(22, 22, '_contact_title', 'field_5a228a4ea30d9'),
(23, 22, 'contact_address', 'FuckYourself st., 228'),
(24, 22, '_contact_address', 'field_5a228a6fa30da'),
(25, 22, 'contact_phone_number', '+00 88005553535'),
(26, 22, '_contact_phone_number', 'field_5a228a87a30db'),
(27, 22, 'contact_name_placeholder', 'name'),
(28, 22, '_contact_name_placeholder', 'field_5a228a97a30dc'),
(29, 22, 'contact_email_placeholder', 'email'),
(30, 22, '_contact_email_placeholder', 'field_5a228aaaa30dd'),
(31, 22, 'contact_map', ''),
(32, 22, '_contact_map', 'field_5a228ab9a30de'),
(33, 17, 'contact_title', ''),
(34, 17, '_contact_title', 'field_5a228a4ea30d9'),
(35, 17, 'contact_address', ''),
(36, 17, '_contact_address', 'field_5a228a6fa30da'),
(37, 17, 'contact_phone_number', ''),
(38, 17, '_contact_phone_number', 'field_5a228a87a30db'),
(39, 17, 'contact_name_placeholder', ''),
(40, 17, '_contact_name_placeholder', 'field_5a228a97a30dc'),
(41, 17, 'contact_email_placeholder', ''),
(42, 17, '_contact_email_placeholder', 'field_5a228aaaa30dd'),
(43, 17, 'contact_map', ''),
(44, 17, '_contact_map', 'field_5a228ab9a30de'),
(45, 23, 'contact_title', 'get in touch'),
(46, 23, '_contact_title', 'field_5a228a4ea30d9'),
(47, 23, 'contact_address', 'FuckYourself st., 228'),
(48, 23, '_contact_address', 'field_5a228a6fa30da'),
(49, 23, 'contact_phone_number', '+00 88005553535'),
(50, 23, '_contact_phone_number', 'field_5a228a87a30db'),
(51, 23, 'contact_name_placeholder', 'name'),
(52, 23, '_contact_name_placeholder', 'field_5a228a97a30dc'),
(53, 23, 'contact_email_placeholder', 'email'),
(54, 23, '_contact_email_placeholder', 'field_5a228aaaa30dd'),
(55, 23, 'contact_map', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.123073808986!2d12.490042215441486!3d41.89021017922119!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f61b6532013ad%3A0x28f1c82e908503c4!2sColosseum!5e0!3m2!1sen!2sua!4v1512217737535" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>'),
(56, 23, '_contact_map', 'field_5a228ab9a30de'),
(57, 24, 'contact_title', 'get in touch'),
(58, 24, '_contact_title', 'field_5a228a4ea30d9'),
(59, 24, 'contact_address', 'FuckYourself st., 228'),
(60, 24, '_contact_address', 'field_5a228a6fa30da'),
(61, 24, 'contact_phone_number', '+00 88005553535'),
(62, 24, '_contact_phone_number', 'field_5a228a87a30db'),
(63, 24, 'contact_name_placeholder', 'name'),
(64, 24, '_contact_name_placeholder', 'field_5a228a97a30dc'),
(65, 24, 'contact_email_placeholder', 'email'),
(66, 24, '_contact_email_placeholder', 'field_5a228aaaa30dd'),
(67, 24, 'contact_map', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.123073808986!2d12.490042215441486!3d41.89021017922119!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f61b6532013ad%3A0x28f1c82e908503c4!2sColosseum!5e0!3m2!1sen!2sua!4v1512217737535'),
(68, 24, '_contact_map', 'field_5a228ab9a30de'),
(69, 26, 'contact_title', 'get in touch'),
(70, 26, '_contact_title', 'field_5a228a4ea30d9'),
(71, 26, 'contact_address', 'FuckYourself st., 228'),
(72, 26, '_contact_address', 'field_5a228a6fa30da'),
(73, 26, 'contact_email', 'fuck@youself.com'),
(74, 26, '_contact_email', 'field_5a229d0c4b5fd'),
(75, 26, 'contact_phone_number', '+00 88005553535'),
(76, 26, '_contact_phone_number', 'field_5a228a87a30db'),
(77, 26, 'contact_name_placeholder', 'name'),
(78, 26, '_contact_name_placeholder', 'field_5a228a97a30dc'),
(79, 26, 'contact_email_placeholder', 'email'),
(80, 26, '_contact_email_placeholder', 'field_5a228aaaa30dd'),
(81, 26, 'contact_map', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.123073808986!2d12.490042215441486!3d41.89021017922119!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f61b6532013ad%3A0x28f1c82e908503c4!2sColosseum!5e0!3m2!1sen!2sua!4v1512217737535'),
(82, 26, '_contact_map', 'field_5a228ab9a30de'),
(83, 17, 'contact_email', ''),
(84, 17, '_contact_email', 'field_5a229d0c4b5fd'),
(85, 28, '_edit_last', '1'),
(86, 28, '_edit_lock', '1512735336:1'),
(87, 32, '_edit_last', '1'),
(88, 32, '_edit_lock', '1512218524:1'),
(89, 33, '_wp_attached_file', '2017/12/NikolaTesla.jpg'),
(90, 33, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:563;s:6:"height";i:540;s:4:"file";s:23:"2017/12/NikolaTesla.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"NikolaTesla-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"NikolaTesla-300x288.jpg";s:5:"width";i:300;s:6:"height";i:288;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(91, 33, '_wp_attachment_image_alt', 'Nikola Tesla'),
(92, 32, 'member_name', 'nikola'),
(93, 32, '_member_name', 'field_5a229ec1966a1'),
(94, 32, 'member_position', 'engineer'),
(95, 32, '_member_position', 'field_5a229eed966a2'),
(96, 32, 'member_photo', '33'),
(97, 32, '_member_photo', 'field_5a229f05966a3'),
(98, 35, '_edit_last', '1'),
(99, 35, '_edit_lock', '1512218859:1'),
(100, 36, '_wp_attached_file', '2017/12/rick_face.png'),
(101, 36, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:1186;s:4:"file";s:21:"2017/12/rick_face.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"rick_face-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"rick_face-259x300.png";s:5:"width";i:259;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:21:"rick_face-768x890.png";s:5:"width";i:768;s:6:"height";i:890;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:22:"rick_face-884x1024.png";s:5:"width";i:884;s:6:"height";i:1024;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(102, 36, '_wp_attachment_image_alt', 'Rick'),
(103, 35, 'member_position', 'artificer'),
(104, 35, '_member_position', 'field_5a229eed966a2'),
(105, 35, 'member_photo', '36'),
(106, 35, '_member_photo', 'field_5a229f05966a3'),
(107, 38, '_edit_last', '1'),
(108, 38, '_edit_lock', '1512219836:1'),
(109, 45, '_edit_last', '1'),
(110, 45, '_edit_lock', '1512219812:1'),
(111, 45, 'skill_name', '1'),
(112, 45, '_skill_name', 'field_5a22a1ed8c8b0'),
(113, 45, 'skill_text', 'best event organizers'),
(114, 45, '_skill_text', 'field_5a22a2088c8b1'),
(115, 45, 'skill_add_button', '1'),
(116, 45, '_skill_add_button', 'field_5a22a2178c8b2'),
(117, 45, 'skill_button_text', 'check it!'),
(118, 45, '_skill_button_text', 'field_5a22a2428c8b3'),
(119, 45, 'skill_button_link', ''),
(120, 45, '_skill_button_link', 'field_5a22a298d35b3'),
(121, 45, '_', 'field_5a22a2b4d35b4'),
(122, 45, 'skill_add_a_button', '1'),
(123, 45, '_skill_add_a_button', 'field_5a22a2178c8b2'),
(124, 48, '_edit_last', '1'),
(125, 48, '_edit_lock', '1512219743:1'),
(126, 48, 'skill_text', 'make your meeting unforgettable'),
(127, 48, '_skill_text', 'field_5a22a2088c8b1'),
(128, 48, 'skill_add_a_button', '0'),
(129, 48, '_skill_add_a_button', 'field_5a22a2178c8b2'),
(130, 49, '_edit_last', '1'),
(131, 49, '_edit_lock', '1512246404:1'),
(132, 61, '_edit_last', '1'),
(133, 61, 'service_subtitle', 'dummy text'),
(134, 61, '_service_subtitle', 'field_5a22a6f3b2eeb'),
(135, 61, 'service_title', ''),
(136, 61, '_service_title', 'field_5a22a717b2eec'),
(137, 61, 'service_text', ''),
(138, 61, '_service_text', 'field_5a22a723b2eed'),
(139, 61, 'service_add_a_button', '1'),
(140, 61, '_service_add_a_button', 'field_5a22a730b2eee'),
(141, 61, 'service_button_text', 'btn text'),
(142, 61, '_service_button_text', 'field_5a22a74eb2eef'),
(143, 61, 'service_button_link', ''),
(144, 61, '_service_button_link', 'field_5a22a75bb2ef0'),
(145, 61, '_edit_lock', '1527680651:1'),
(146, 62, '_wp_attached_file', '2017/12/original.jpg'),
(147, 62, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:567;s:6:"height";i:361;s:4:"file";s:20:"2017/12/original.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"original-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"original-300x191.jpg";s:5:"width";i:300;s:6:"height";i:191;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"8";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"60";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:4:"0.01";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(148, 62, '_wp_attachment_image_alt', 'chebureck'),
(149, 61, '_thumbnail_id', '62'),
(150, 63, '_edit_last', '1'),
(151, 63, 'service_subtitle', 'as if from Naples'),
(152, 63, '_service_subtitle', 'field_5a22a6f3b2eeb'),
(153, 63, 'service_title', ''),
(154, 63, '_service_title', 'field_5a22a717b2eec'),
(155, 63, 'service_text', ''),
(156, 63, '_service_text', 'field_5a22a723b2eed'),
(157, 63, 'service_add_a_button', '1'),
(158, 63, '_service_add_a_button', 'field_5a22a730b2eee'),
(159, 63, 'service_button_text', 'order me'),
(160, 63, '_service_button_text', 'field_5a22a74eb2eef'),
(161, 63, 'service_button_link', 'https://ilmolino.ua/'),
(162, 63, '_service_button_link', 'field_5a22a75bb2ef0'),
(163, 63, '_edit_lock', '1527680649:1'),
(164, 64, '_wp_attached_file', '2017/12/pizza.jpg'),
(165, 64, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1328;s:6:"height";i:747;s:4:"file";s:17:"2017/12/pizza.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"pizza-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"pizza-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:17:"pizza-768x432.jpg";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:18:"pizza-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(166, 64, '_wp_attachment_image_alt', 'pizza'),
(167, 63, '_thumbnail_id', '64'),
(168, 66, '_edit_last', '1'),
(169, 66, '_edit_lock', '1527680654:1'),
(170, 66, 'service_subtitle', 'wedding'),
(171, 66, '_service_subtitle', 'field_5a22a6f3b2eeb'),
(172, 66, 'service_title', ''),
(173, 66, '_service_title', 'field_5a22a717b2eec'),
(174, 66, 'service_text', ''),
(175, 66, '_service_text', 'field_5a22a723b2eed'),
(176, 66, 'service_add_a_button', '0'),
(177, 66, '_service_add_a_button', 'field_5a22a730b2eee'),
(178, 67, '_wp_attached_file', '2017/12/wedding.jpg'),
(179, 67, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:716;s:6:"height";i:476;s:4:"file";s:19:"2017/12/wedding.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"wedding-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"wedding-300x199.jpg";s:5:"width";i:300;s:6:"height";i:199;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(180, 67, '_wp_attachment_image_alt', 'wedding'),
(181, 66, '_thumbnail_id', '67'),
(184, 69, '_edit_last', '1'),
(185, 69, '_edit_lock', '1527674253:1'),
(186, 70, 'contact_title', ''),
(187, 70, '_contact_title', 'field_5a228a4ea30d9'),
(188, 70, 'contact_address', ''),
(189, 70, '_contact_address', 'field_5a228a6fa30da'),
(190, 70, 'contact_email', ''),
(191, 70, '_contact_email', 'field_5a229d0c4b5fd'),
(192, 70, 'contact_phone_number', ''),
(193, 70, '_contact_phone_number', 'field_5a228a87a30db'),
(194, 70, 'contact_name_placeholder', ''),
(195, 70, '_contact_name_placeholder', 'field_5a228a97a30dc'),
(196, 70, 'contact_email_placeholder', ''),
(197, 70, '_contact_email_placeholder', 'field_5a228aaaa30dd'),
(198, 70, 'contact_map', ''),
(199, 70, '_contact_map', 'field_5a228ab9a30de'),
(200, 71, '_edit_last', '1'),
(201, 71, '_edit_lock', '1527680039:1'),
(202, 71, 'contact_title', ''),
(203, 71, '_contact_title', 'field_5a228a4ea30d9'),
(204, 71, 'contact_address', 'Address Text'),
(205, 71, '_contact_address', 'field_5a228a6fa30da'),
(206, 71, 'contact_email', 'testemail@mail.com'),
(207, 71, '_contact_email', 'field_5a229d0c4b5fd'),
(208, 71, 'contact_phone_number', '8 800 555 35 35'),
(209, 71, '_contact_phone_number', 'field_5a228a87a30db'),
(210, 71, 'contact_name_placeholder', 'name'),
(211, 71, '_contact_name_placeholder', 'field_5a228a97a30dc'),
(212, 71, 'contact_email_placeholder', 'email'),
(213, 71, '_contact_email_placeholder', 'field_5a228aaaa30dd'),
(214, 71, 'contact_map', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.123073808986!2d12.490042215441486!3d41.89021017922119!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f61b6532013ad%3A0x28f1c82e908503c4!2sColosseum!5e0!3m2!1sen!2sua!4v1512217737535'),
(215, 71, '_contact_map', 'field_5a228ab9a30de'),
(216, 72, '_edit_last', '1'),
(217, 72, '_edit_lock', '1527682169:1'),
(218, 80, '_wp_attached_file', '2017/12/21rickmorty.jpg'),
(219, 80, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:620;s:6:"height";i:300;s:4:"file";s:23:"2017/12/21rickmorty.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"21rickmorty-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"21rickmorty-300x145.jpg";s:5:"width";i:300;s:6:"height";i:145;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(220, 80, '_wp_attachment_image_alt', 'intergalactic journey'),
(221, 81, '_wp_attached_file', '2017/12/Rick-and-Morty-Rickstaverse-2.jpg'),
(222, 81, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:560;s:6:"height";i:560;s:4:"file";s:41:"2017/12/Rick-and-Morty-Rickstaverse-2.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:41:"Rick-and-Morty-Rickstaverse-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:41:"Rick-and-Morty-Rickstaverse-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(223, 81, '_wp_attachment_image_alt', 'Fire event'),
(240, 82, '_wp_attached_file', '2017/12/rick_and_morty_april_fools.jpg'),
(241, 82, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:717;s:6:"height";i:463;s:4:"file";s:38:"2017/12/rick_and_morty_april_fools.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:38:"rick_and_morty_april_fools-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:38:"rick_and_morty_april_fools-300x194.jpg";s:5:"width";i:300;s:6:"height";i:194;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(242, 82, '_wp_attachment_image_alt', 'wide'),
(243, 83, '_wp_attached_file', '2017/12/RAM_Pilot.jpg'),
(244, 83, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:820;s:6:"height";i:430;s:4:"file";s:21:"2017/12/RAM_Pilot.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"RAM_Pilot-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"RAM_Pilot-300x157.jpg";s:5:"width";i:300;s:6:"height";i:157;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:21:"RAM_Pilot-768x403.jpg";s:5:"width";i:768;s:6:"height";i:403;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(245, 83, '_wp_attachment_image_alt', 'eee boi'),
(258, 84, '_wp_attached_file', '2017/12/a2m8kV9.png'),
(259, 84, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1000;s:6:"height";i:568;s:4:"file";s:19:"2017/12/a2m8kV9.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"a2m8kV9-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:19:"a2m8kV9-300x170.png";s:5:"width";i:300;s:6:"height";i:170;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:19:"a2m8kV9-768x436.png";s:5:"width";i:768;s:6:"height";i:436;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(260, 84, '_wp_attachment_image_alt', 'wars'),
(261, 85, '_wp_attached_file', '2017/12/screenshot.png'),
(262, 85, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:350;s:4:"file";s:22:"2017/12/screenshot.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"screenshot-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:22:"screenshot-300x140.png";s:5:"width";i:300;s:6:"height";i:140;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(263, 85, '_wp_attachment_image_alt', 'design'),
(276, 86, '_edit_last', '1'),
(277, 86, '_edit_lock', '1512482211:1'),
(278, 93, '_wp_attached_file', '2017/12/aj.png'),
(279, 93, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:200;s:6:"height";i:200;s:4:"file";s:14:"2017/12/aj.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:14:"aj-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(280, 93, '_wp_attachment_image_alt', 'bearded man'),
(281, 92, '_edit_last', '1'),
(282, 92, 'review_author', ''),
(283, 92, '_review_author', 'field_5a22bf402b580'),
(284, 92, 'review_position', 'bearded man'),
(285, 92, '_review_position', 'field_5a22bfeb2b581'),
(286, 92, 'review_text', 'the best agency ever!'),
(287, 92, '_review_text', 'field_5a22bff52b582'),
(288, 92, 'review_photo', '93'),
(289, 92, '_review_photo', 'field_5a22bffc2b583'),
(290, 92, '_edit_lock', '1527680632:1'),
(291, 95, '_wp_attached_file', '2017/12/trump.jpg'),
(292, 95, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:400;s:4:"file";s:17:"2017/12/trump.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"trump-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"trump-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(293, 95, '_wp_attachment_image_alt', 'trump'),
(294, 94, '_edit_last', '1'),
(295, 94, 'review_author', ''),
(296, 94, '_review_author', 'field_5a22bf402b580'),
(297, 94, 'review_position', 'president of the U.S.A'),
(298, 94, '_review_position', 'field_5a22bfeb2b581'),
(299, 94, 'review_text', 'very pleased with how they organized my inauguration'),
(300, 94, '_review_text', 'field_5a22bff52b582'),
(301, 94, 'review_photo', '95'),
(302, 94, '_review_photo', 'field_5a22bffc2b583'),
(303, 94, '_edit_lock', '1512466053:1'),
(304, 97, '_wp_attached_file', '2017/12/Elon_Musk_2015.jpg'),
(305, 97, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1011;s:6:"height";i:1484;s:4:"file";s:26:"2017/12/Elon_Musk_2015.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"Elon_Musk_2015-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"Elon_Musk_2015-204x300.jpg";s:5:"width";i:204;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:27:"Elon_Musk_2015-768x1127.jpg";s:5:"width";i:768;s:6:"height";i:1127;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:27:"Elon_Musk_2015-698x1024.jpg";s:5:"width";i:698;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"4.5";s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1433864313";s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"100";s:3:"iso";s:4:"1000";s:13:"shutter_speed";s:7:"0.00625";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(306, 97, '_wp_attachment_image_alt', 'Elon Musk'),
(307, 96, '_edit_last', '1'),
(308, 96, 'review_author', ''),
(309, 96, '_review_author', 'field_5a22bf402b580'),
(310, 96, 'review_position', 'inventor'),
(311, 96, '_review_position', 'field_5a22bfeb2b581'),
(312, 96, 'review_text', ' always work only with clemo'),
(313, 96, '_review_text', 'field_5a22bff52b582'),
(314, 96, 'review_photo', '97'),
(315, 96, '_review_photo', 'field_5a22bffc2b583'),
(316, 96, '_edit_lock', '1512482210:1'),
(317, 99, '_wp_attached_file', '2017/12/zhdun.jpg'),
(318, 99, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:348;s:6:"height";i:446;s:4:"file";s:17:"2017/12/zhdun.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"zhdun-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"zhdun-234x300.jpg";s:5:"width";i:234;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(319, 99, '_wp_attachment_image_alt', 'zhdun'),
(320, 98, '_edit_last', '1'),
(321, 98, 'review_author', ''),
(322, 98, '_review_author', 'field_5a22bf402b580'),
(323, 98, 'review_position', 'zhdun'),
(324, 98, '_review_position', 'field_5a22bfeb2b581'),
(325, 98, 'review_text', 'now I do not need to wait!'),
(326, 98, '_review_text', 'field_5a22bff52b582'),
(327, 98, 'review_photo', '99'),
(328, 98, '_review_photo', 'field_5a22bffc2b583'),
(329, 98, '_edit_lock', '1512482211:1'),
(357, 104, '_menu_item_type', 'post_type'),
(358, 104, '_menu_item_menu_item_parent', '0'),
(359, 104, '_menu_item_object_id', '5'),
(360, 104, '_menu_item_object', 'page'),
(361, 104, '_menu_item_target', ''),
(362, 104, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(363, 104, '_menu_item_xfn', ''),
(364, 104, '_menu_item_url', ''),
(365, 104, '_menu_item_orphaned', '1512246830'),
(375, 106, '_menu_item_type', 'post_type'),
(376, 106, '_menu_item_menu_item_parent', '0'),
(377, 106, '_menu_item_object_id', '5'),
(378, 106, '_menu_item_object', 'page'),
(379, 106, '_menu_item_target', ''),
(380, 106, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(381, 106, '_menu_item_xfn', ''),
(382, 106, '_menu_item_url', ''),
(383, 106, '_menu_item_orphaned', '1512248704'),
(420, 111, '_menu_item_type', 'post_type'),
(421, 111, '_menu_item_menu_item_parent', '0'),
(422, 111, '_menu_item_object_id', '5'),
(423, 111, '_menu_item_object', 'page'),
(424, 111, '_menu_item_target', ''),
(425, 111, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(426, 111, '_menu_item_xfn', ''),
(427, 111, '_menu_item_url', ''),
(428, 111, '_menu_item_orphaned', '1512248823'),
(429, 112, '_menu_item_type', 'post_type'),
(430, 112, '_menu_item_menu_item_parent', '0'),
(431, 112, '_menu_item_object_id', '7'),
(432, 112, '_menu_item_object', 'page'),
(433, 112, '_menu_item_target', ''),
(434, 112, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(435, 112, '_menu_item_xfn', ''),
(436, 112, '_menu_item_url', ''),
(437, 112, '_menu_item_orphaned', '1512248823'),
(438, 113, '_menu_item_type', 'post_type'),
(439, 113, '_menu_item_menu_item_parent', '0'),
(440, 113, '_menu_item_object_id', '17'),
(441, 113, '_menu_item_object', 'page'),
(442, 113, '_menu_item_target', ''),
(443, 113, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(444, 113, '_menu_item_xfn', ''),
(445, 113, '_menu_item_url', ''),
(446, 113, '_menu_item_orphaned', '1512248823'),
(447, 114, '_menu_item_type', 'post_type'),
(448, 114, '_menu_item_menu_item_parent', '0'),
(449, 114, '_menu_item_object_id', '5'),
(450, 114, '_menu_item_object', 'page'),
(451, 114, '_menu_item_target', ''),
(452, 114, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(453, 114, '_menu_item_xfn', ''),
(454, 114, '_menu_item_url', ''),
(455, 114, '_menu_item_orphaned', '1512248823'),
(456, 115, '_menu_item_type', 'post_type'),
(457, 115, '_menu_item_menu_item_parent', '0'),
(458, 115, '_menu_item_object_id', '19'),
(459, 115, '_menu_item_object', 'page'),
(460, 115, '_menu_item_target', ''),
(461, 115, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(462, 115, '_menu_item_xfn', ''),
(463, 115, '_menu_item_url', ''),
(464, 115, '_menu_item_orphaned', '1512248823'),
(465, 116, '_menu_item_type', 'post_type'),
(466, 116, '_menu_item_menu_item_parent', '0'),
(467, 116, '_menu_item_object_id', '19'),
(468, 116, '_menu_item_object', 'page'),
(469, 116, '_menu_item_target', ''),
(470, 116, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(471, 116, '_menu_item_xfn', ''),
(472, 116, '_menu_item_url', ''),
(474, 117, '_menu_item_type', 'post_type'),
(475, 117, '_menu_item_menu_item_parent', '0'),
(476, 117, '_menu_item_object_id', '17'),
(477, 117, '_menu_item_object', 'page'),
(478, 117, '_menu_item_target', ''),
(479, 117, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(480, 117, '_menu_item_xfn', ''),
(481, 117, '_menu_item_url', ''),
(483, 118, '_menu_item_type', 'post_type'),
(484, 118, '_menu_item_menu_item_parent', '0'),
(485, 118, '_menu_item_object_id', '7'),
(486, 118, '_menu_item_object', 'page'),
(487, 118, '_menu_item_target', ''),
(488, 118, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(489, 118, '_menu_item_xfn', ''),
(490, 118, '_menu_item_url', ''),
(492, 119, '_menu_item_type', 'post_type'),
(493, 119, '_menu_item_menu_item_parent', '0'),
(494, 119, '_menu_item_object_id', '5'),
(495, 119, '_menu_item_object', 'page'),
(496, 119, '_menu_item_target', ''),
(497, 119, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(498, 119, '_menu_item_xfn', ''),
(499, 119, '_menu_item_url', ''),
(500, 120, '_edit_last', '1'),
(501, 120, '_edit_lock', '1513091587:1'),
(502, 120, '_wp_page_template', 'page-works.php'),
(503, 121, '_menu_item_type', 'post_type'),
(504, 121, '_menu_item_menu_item_parent', '0'),
(505, 121, '_menu_item_object_id', '120'),
(506, 121, '_menu_item_object', 'page'),
(507, 121, '_menu_item_target', ''),
(508, 121, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(509, 121, '_menu_item_xfn', ''),
(510, 121, '_menu_item_url', ''),
(516, 129, '_edit_last', '1'),
(517, 129, '_edit_lock', '1527680717:1'),
(518, 129, 'work_description', 'our firs work'),
(519, 129, '_work_description', 'field_5a23cf41c208a'),
(520, 129, 'work_gallery', ''),
(521, 129, '_work_gallery', 'field_5a23cf51c208b'),
(522, 129, '_thumbnail_id', '80'),
(523, 130, '_edit_last', '1'),
(524, 130, '_edit_lock', '1527680711:1'),
(525, 131, '_wp_attached_file', '2017/12/spiderman.jpg'),
(526, 131, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1200;s:6:"height";i:675;s:4:"file";s:21:"2017/12/spiderman.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"spiderman-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"spiderman-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:21:"spiderman-768x432.jpg";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:22:"spiderman-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"2.8";s:6:"credit";s:14:"Ahn Young-joon";s:6:"camera";s:21:"Canon EOS 5D Mark III";s:7:"caption";s:242:"Workers wearing Spider-Man costumes take pictures a woman during a promotional event for film "Spider-Man: Homecoming" in Seoul, South Korea, Sunday, July 2, 2017. The film will be released in South Korea on July 5. (AP Photo/Ahn Young-joon).";s:17:"created_timestamp";s:10:"1499014382";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"16";s:3:"iso";s:4:"4000";s:13:"shutter_speed";s:5:"0.004";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(527, 132, '_wp_attached_file', '2017/12/SpiderManfans.jpg'),
(528, 132, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:500;s:6:"height";i:238;s:4:"file";s:25:"2017/12/SpiderManfans.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"SpiderManfans-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"SpiderManfans-300x143.jpg";s:5:"width";i:300;s:6:"height";i:143;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(531, 134, '_wp_attached_file', '2017/12/smfans.jpg'),
(532, 134, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:275;s:6:"height";i:183;s:4:"file";s:18:"2017/12/smfans.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"smfans-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(533, 130, '_thumbnail_id', '134'),
(534, 130, 'work_description', ''),
(535, 130, '_work_description', 'field_5a23cf41c208a'),
(536, 130, 'work_gallery', ''),
(537, 130, '_work_gallery', 'field_5a23cf51c208b'),
(538, 135, '_edit_last', '1'),
(539, 135, '_edit_lock', '1527680931:1'),
(540, 136, '_wp_attached_file', '2017/12/centara.jpg'),
(541, 136, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:550;s:6:"height";i:366;s:4:"file";s:19:"2017/12/centara.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"centara-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"centara-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(542, 137, '_wp_attached_file', '2017/12/centara-1.jpg'),
(543, 137, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:550;s:6:"height";i:366;s:4:"file";s:21:"2017/12/centara-1.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"centara-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"centara-1-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(544, 138, '_wp_attached_file', '2017/12/fireshow1.jpg'),
(545, 138, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:700;s:6:"height";i:468;s:4:"file";s:21:"2017/12/fireshow1.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"fireshow1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"fireshow1-300x201.jpg";s:5:"width";i:300;s:6:"height";i:201;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(546, 139, '_wp_attached_file', '2017/12/fireshow2.jpg'),
(547, 139, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:950;s:6:"height";i:649;s:4:"file";s:21:"2017/12/fireshow2.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"fireshow2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"fireshow2-300x205.jpg";s:5:"width";i:300;s:6:"height";i:205;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:21:"fireshow2-768x525.jpg";s:5:"width";i:768;s:6:"height";i:525;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(548, 135, '_thumbnail_id', '136'),
(549, 135, 'work_description', 'fire agon\''),
(550, 135, '_work_description', 'field_5a23cf41c208a'),
(551, 135, 'work_gallery', ''),
(552, 135, '_work_gallery', 'field_5a23cf51c208b'),
(553, 140, '_edit_last', '1'),
(554, 140, '_edit_lock', '1530077223:1'),
(555, 140, 'work_description', 'another work'),
(556, 140, '_work_description', 'field_5a23cf41c208a'),
(557, 140, 'work_gallery', ''),
(558, 140, '_work_gallery', 'field_5a23cf51c208b'),
(559, 140, '_thumbnail_id', '99'),
(560, 141, '_edit_last', '1'),
(561, 141, '_edit_lock', '1527680931:1'),
(562, 141, '_thumbnail_id', '134'),
(563, 141, 'work_description', 'topchik life'),
(564, 141, '_work_description', 'field_5a23cf41c208a'),
(565, 141, 'work_gallery', ''),
(566, 141, '_work_gallery', 'field_5a23cf51c208b'),
(567, 142, '_edit_last', '1'),
(568, 142, '_edit_lock', '1527680687:1'),
(569, 143, '_wp_attached_file', '2017/12/Developers.jpg'),
(570, 143, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:631;s:6:"height";i:522;s:4:"file";s:22:"2017/12/Developers.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"Developers-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"Developers-300x248.jpg";s:5:"width";i:300;s:6:"height";i:248;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(571, 142, '_thumbnail_id', '143'),
(572, 142, 'work_description', ''),
(573, 142, '_work_description', 'field_5a23cf41c208a'),
(574, 142, 'work_gallery', ''),
(575, 142, '_work_gallery', 'field_5a23cf51c208b'),
(576, 144, '_edit_last', '1'),
(577, 144, '_edit_lock', '1527680692:1'),
(578, 145, '_wp_attached_file', '2017/12/hacker.jpg'),
(579, 145, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:640;s:6:"height";i:360;s:4:"file";s:18:"2017/12/hacker.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"hacker-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"hacker-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(580, 144, '_thumbnail_id', '145'),
(581, 144, 'work_description', 'Thank you'),
(582, 144, '_work_description', 'field_5a23cf41c208a'),
(583, 144, 'work_gallery', ''),
(584, 144, '_work_gallery', 'field_5a23cf51c208b'),
(588, 148, 'title', 'NextGEN Basic Thumbnails'),
(589, 148, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_gallery\\static\\thumb_preview.jpg'),
(590, 148, 'default_source', 'galleries'),
(591, 148, 'view_order', '10000'),
(592, 148, 'name', 'photocrati-nextgen_basic_thumbnails'),
(593, 148, 'installed_at_version', '2.2.16'),
(594, 148, 'hidden_from_ui', ''),
(595, 148, 'hidden_from_igw', ''),
(596, 148, '__defaults_set', '1'),
(597, 148, 'filter', 'raw'),
(598, 148, 'entity_types', 'WyJpbWFnZSJd'),
(599, 148, 'aliases', 'WyJiYXNpY190aHVtYm5haWwiLCJiYXNpY190aHVtYm5haWxzIiwibmV4dGdlbl9iYXNpY190aHVtYm5haWxzIl0='),
(600, 148, 'id_field', 'ID'),
(601, 148, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJpbWFnZXNfcGVyX3BhZ2UiOiIyMCIsIm51bWJlcl9vZl9jb2x1bW5zIjowLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJzaG93X2FsbF9pbl9saWdodGJveCI6MCwiYWpheF9wYWdpbmF0aW9uIjowLCJ1c2VfaW1hZ2Vicm93c2VyX2VmZmVjdCI6MCwidGVtcGxhdGUiOiIiLCJkaXNwbGF5X25vX2ltYWdlc19lcnJvciI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJzaG93X3NsaWRlc2hvd19saW5rIjoxLCJzbGlkZXNob3dfbGlua190ZXh0IjoiW1Nob3cgc2xpZGVzaG93XSIsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOiIxMDAiLCJ0aHVtYm5haWxfY3JvcCI6MSwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9'),
(602, 149, 'title', 'NextGEN Basic Slideshow'),
(603, 149, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_gallery\\static\\slideshow_preview.jpg'),
(604, 149, 'default_source', 'galleries'),
(605, 149, 'view_order', '10010'),
(606, 149, 'name', 'photocrati-nextgen_basic_slideshow'),
(607, 149, 'installed_at_version', '2.2.16'),
(608, 149, 'hidden_from_ui', ''),
(609, 149, 'hidden_from_igw', ''),
(610, 149, '__defaults_set', '1'),
(611, 149, 'filter', 'raw'),
(612, 149, 'entity_types', 'WyJpbWFnZSJd'),
(613, 149, 'aliases', 'WyJiYXNpY19zbGlkZXNob3ciLCJuZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyJd'),
(614, 149, 'id_field', 'ID'),
(615, 149, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X3dpZHRoIjo2MDAsImdhbGxlcnlfaGVpZ2h0Ijo0MDAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsImN5Y2xlX2ludGVydmFsIjoxMCwiY3ljbGVfZWZmZWN0IjoiZmFkZSIsImVmZmVjdF9jb2RlIjoiY2xhc3M9XCJuZ2ctZmFuY3lib3hcIiByZWw9XCIlR0FMTEVSWV9OQU1FJVwiIiwic2hvd190aHVtYm5haWxfbGluayI6MSwidGh1bWJuYWlsX2xpbmtfdGV4dCI6IltTaG93IHRodW1ibmFpbHNdIiwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(616, 150, 'title', 'NextGEN Basic ImageBrowser'),
(617, 150, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_imagebrowser\\static\\preview.jpg'),
(618, 150, 'default_source', 'galleries'),
(619, 150, 'view_order', '10020'),
(620, 150, 'name', 'photocrati-nextgen_basic_imagebrowser'),
(621, 150, 'installed_at_version', '2.2.16'),
(622, 150, 'hidden_from_ui', ''),
(623, 150, 'hidden_from_igw', ''),
(624, 150, '__defaults_set', '1'),
(625, 150, 'filter', 'raw'),
(626, 150, 'entity_types', 'WyJpbWFnZSJd'),
(627, 150, 'aliases', 'WyJiYXNpY19pbWFnZWJyb3dzZXIiLCJpbWFnZWJyb3dzZXIiLCJuZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciJd'),
(628, 150, 'id_field', 'ID'),
(629, 150, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(630, 151, 'title', 'NextGEN Basic SinglePic'),
(631, 151, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_singlepic\\static\\preview.gif'),
(632, 151, 'default_source', 'galleries'),
(633, 151, 'view_order', '10060'),
(634, 151, 'hidden_from_ui', '1'),
(635, 151, 'hidden_from_igw', '1'),
(636, 151, 'name', 'photocrati-nextgen_basic_singlepic'),
(637, 151, 'installed_at_version', '2.2.16'),
(638, 151, '__defaults_set', '1'),
(639, 151, 'filter', 'raw'),
(640, 151, 'entity_types', 'WyJpbWFnZSJd'),
(641, 151, 'aliases', 'WyJiYXNpY19zaW5nbGVwaWMiLCJzaW5nbGVwaWMiLCJuZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyJd'),
(642, 151, 'id_field', 'ID'),
(643, 151, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ3aWR0aCI6IiIsImhlaWdodCI6IiIsIm1vZGUiOiIiLCJkaXNwbGF5X3dhdGVybWFyayI6MCwiZGlzcGxheV9yZWZsZWN0aW9uIjowLCJmbG9hdCI6IiIsImxpbmsiOiIiLCJsaW5rX3RhcmdldCI6Il9ibGFuayIsInF1YWxpdHkiOjEwMCwiY3JvcCI6MCwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(644, 152, 'title', 'NextGEN Basic TagCloud'),
(645, 152, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_tagcloud\\static\\preview.gif'),
(646, 152, 'default_source', 'tags'),
(647, 152, 'view_order', '10100'),
(648, 152, 'name', 'photocrati-nextgen_basic_tagcloud'),
(649, 152, 'installed_at_version', '2.2.16'),
(650, 152, 'hidden_from_ui', ''),
(651, 152, 'hidden_from_igw', ''),
(652, 152, '__defaults_set', '1'),
(653, 152, 'filter', 'raw'),
(654, 152, 'entity_types', 'WyJpbWFnZSJd'),
(655, 152, 'aliases', 'WyJiYXNpY190YWdjbG91ZCIsInRhZ2Nsb3VkIiwibmV4dGdlbl9iYXNpY190YWdjbG91ZCJd'),
(656, 152, 'id_field', 'ID'),
(657, 152, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwibnVtYmVyIjo0NSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9'),
(658, 153, 'title', 'NextGEN Basic Compact Album'),
(659, 153, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_album\\static\\compact_preview.jpg'),
(660, 153, 'default_source', 'albums'),
(661, 153, 'view_order', '10200'),
(662, 153, 'name', 'photocrati-nextgen_basic_compact_album'),
(663, 153, 'installed_at_version', '2.2.16'),
(664, 153, 'hidden_from_ui', ''),
(665, 153, 'hidden_from_igw', ''),
(666, 153, '__defaults_set', '1'),
(667, 153, 'filter', 'raw'),
(668, 153, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(669, 153, 'aliases', 'WyJiYXNpY19jb21wYWN0X2FsYnVtIiwibmV4dGdlbl9iYXNpY19hbGJ1bSIsImJhc2ljX2FsYnVtX2NvbXBhY3QiLCJjb21wYWN0X2FsYnVtIl0='),
(670, 153, 'id_field', 'ID'),
(671, 153, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJlbmFibGVfZGVzY3JpcHRpb25zIjowLCJ0ZW1wbGF0ZSI6IiIsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(672, 154, 'title', 'NextGEN Basic Extended Album'),
(673, 154, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_album\\static\\extended_preview.jpg'),
(674, 154, 'default_source', 'albums'),
(675, 154, 'view_order', '10210'),
(676, 154, 'name', 'photocrati-nextgen_basic_extended_album'),
(677, 154, 'installed_at_version', '2.2.16'),
(678, 154, 'hidden_from_ui', ''),
(679, 154, 'hidden_from_igw', ''),
(680, 154, '__defaults_set', '1'),
(681, 154, 'filter', 'raw'),
(682, 154, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(683, 154, 'aliases', 'WyJiYXNpY19leHRlbmRlZF9hbGJ1bSIsIm5leHRnZW5fYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJleHRlbmRlZF9hbGJ1bSJd'),
(684, 154, 'id_field', 'ID'),
(685, 154, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJlbmFibGVfZGVzY3JpcHRpb25zIjowLCJ0ZW1wbGF0ZSI6IiIsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjowLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJ0aHVtYm5haWxfcXVhbGl0eSI6MTAwLCJ0aHVtYm5haWxfY3JvcCI6dHJ1ZSwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(686, 155, '__defaults_set', '1'),
(687, 155, 'filter', 'raw'),
(688, 155, 'id_field', 'ID'),
(689, 156, '__defaults_set', '1'),
(690, 156, 'filter', 'raw'),
(691, 156, 'id_field', 'ID'),
(698, 157, '__defaults_set', '1'),
(699, 157, 'filter', 'raw'),
(700, 157, 'id_field', 'ID'),
(701, 158, '__defaults_set', '1'),
(702, 158, 'filter', 'raw'),
(703, 158, 'id_field', 'ID'),
(704, 159, '__defaults_set', '1'),
(705, 159, 'filter', 'raw'),
(706, 159, 'id_field', 'ID'),
(713, 160, '__defaults_set', '1'),
(714, 160, 'filter', 'raw'),
(715, 160, 'id_field', 'ID'),
(716, 161, '__defaults_set', '1'),
(717, 161, 'filter', 'raw'),
(718, 161, 'id_field', 'ID'),
(719, 162, '__defaults_set', '1'),
(720, 162, 'filter', 'raw'),
(721, 162, 'id_field', 'ID'),
(731, 164, '__defaults_set', '1'),
(732, 164, 'filter', 'raw'),
(733, 164, 'id_field', 'ID'),
(734, 165, '__defaults_set', '1'),
(735, 165, 'filter', 'raw'),
(736, 165, 'id_field', 'ID'),
(746, 167, '__defaults_set', '1'),
(747, 167, 'filter', 'raw'),
(748, 167, 'id_field', 'ID'),
(758, 163, '__defaults_set', '1'),
(759, 163, 'filter', 'raw'),
(760, 163, 'id_field', 'ID'),
(761, 168, '__defaults_set', '1'),
(762, 168, 'filter', 'raw'),
(763, 168, 'id_field', 'ID'),
(764, 166, '__defaults_set', '1'),
(765, 166, 'filter', 'raw'),
(766, 166, 'id_field', 'ID'),
(767, 144, 'subtitle', 'subtitle'),
(768, 144, '_subtitle', 'field_5a23cf41c208a'),
(769, 130, 'subtitle', ''),
(770, 130, '_subtitle', 'field_5a23cf41c208a'),
(771, 172, '_wp_attached_file', '2017/12/cropped-centara-1.jpg'),
(772, 172, '_wp_attachment_context', 'custom-header'),
(773, 172, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:1000;s:6:"height";i:250;s:4:"file";s:29:"2017/12/cropped-centara-1.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:29:"cropped-centara-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:28:"cropped-centara-1-300x75.jpg";s:5:"width";i:300;s:6:"height";i:75;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:29:"cropped-centara-1-768x192.jpg";s:5:"width";i:768;s:6:"height";i:192;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:137;}'),
(774, 172, '_wp_attachment_custom_header_last_used_clemo', '1512672054'),
(775, 172, '_wp_attachment_is_custom_header', 'clemo'),
(779, 175, '_wp_attached_file', '2017/12/cropped-logo.png'),
(780, 175, '_wp_attachment_context', 'custom-logo'),
(781, 175, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:104;s:6:"height";i:24;s:4:"file";s:24:"2017/12/cropped-logo.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(789, 179, '_wp_attached_file', '2017/12/bisque.jpg'),
(790, 179, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:256;s:6:"height";i:256;s:4:"file";s:18:"2017/12/bisque.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"bisque-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(803, 186, '_wp_attached_file', '2017/12/logo.png');
INSERT INTO `clm_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(804, 186, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:104;s:6:"height";i:24;s:4:"file";s:16:"2017/12/logo.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(807, 188, '_edit_last', '1'),
(808, 188, '_edit_lock', '1527682184:1'),
(809, 188, '_wp_page_template', 'page-about_us.php'),
(810, 189, '_menu_item_type', 'post_type'),
(811, 189, '_menu_item_menu_item_parent', '0'),
(812, 189, '_menu_item_object_id', '188'),
(813, 189, '_menu_item_object', 'page'),
(814, 189, '_menu_item_target', ''),
(815, 189, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(816, 189, '_menu_item_xfn', ''),
(817, 189, '_menu_item_url', ''),
(820, 193, 'services_section_header', 'what we do'),
(821, 193, '_services_section_header', 'field_5a2a786bc314f'),
(822, 5, 'services_section_header', 'we do'),
(823, 5, '_services_section_header', 'field_5a2fef33a38f1'),
(824, 195, 'services_section_header', 'what we do'),
(825, 195, '_services_section_header', 'field_5a2a786bc314f'),
(826, 195, 'work_section_header', 'our best work'),
(827, 195, '_work_section_header', 'field_5a2a78dca40ce'),
(828, 5, 'work_section_header', ''),
(829, 5, '_work_section_header', 'field_5a2a78dca40ce'),
(833, 197, 'services_section_header', ''),
(834, 197, '_services_section_header', 'field_5a2a786bc314f'),
(835, 197, 'work_section_header', ''),
(836, 197, '_work_section_header', 'field_5a2a78dca40ce'),
(837, 198, '_wp_attached_file', '2017/12/photo_2017-11-23_15-51-05.jpg'),
(838, 198, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:960;s:6:"height";i:1280;s:4:"file";s:37:"2017/12/photo_2017-11-23_15-51-05.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:37:"photo_2017-11-23_15-51-05-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:37:"photo_2017-11-23_15-51-05-225x300.jpg";s:5:"width";i:225;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:38:"photo_2017-11-23_15-51-05-768x1024.jpg";s:5:"width";i:768;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:38:"photo_2017-11-23_15-51-05-768x1024.jpg";s:5:"width";i:768;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(839, 69, 'member_position', 'manager'),
(840, 69, '_member_position', 'field_5a229eed966a2'),
(841, 69, 'member_photo', '198'),
(842, 69, '_member_photo', 'field_5a229f05966a3'),
(843, 199, 'header', 'get in touch'),
(844, 199, '_header', 'field_5a2a786bc314f'),
(845, 17, 'header', 'get in touch'),
(846, 17, '_header', 'field_5a2a786bc314f'),
(847, 201, '_edit_last', '1'),
(848, 201, '_edit_lock', '1527680615:1'),
(851, 203, '_wp_attached_file', '2017/12/trolling.jpg'),
(852, 203, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1080;s:4:"file";s:20:"2017/12/trolling.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"trolling-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"trolling-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"trolling-768x432.jpg";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:21:"trolling-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(853, 201, '_thumbnail_id', '259'),
(856, 1, '_edit_lock', '1527680622:1'),
(857, 204, '_wp_attached_file', '2017/12/hola-mundo-en-c.jpg'),
(858, 204, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:450;s:6:"height";i:253;s:4:"file";s:27:"2017/12/hola-mundo-en-c.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"hola-mundo-en-c-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:27:"hola-mundo-en-c-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(859, 1, '_edit_last', '1'),
(860, 1, '_thumbnail_id', '204'),
(875, 207, '_edit_last', '1'),
(876, 207, '_edit_lock', '1530077207:1'),
(880, 209, '_edit_last', '1'),
(881, 209, '_edit_lock', '1527680604:1'),
(888, 211, '_edit_last', '1'),
(889, 211, '_edit_lock', '1527680398:1'),
(890, 217, 'works_section_header', 'best works'),
(891, 217, '_works_section_header', 'field_5a2fef1da38f0'),
(892, 217, 'services_section_header', 'we do'),
(893, 217, '_services_section_header', 'field_5a2fef33a38f1'),
(894, 217, 'contacts_section_header', 'ss'),
(895, 217, '_contacts_section_header', 'field_5a2fefdfa38f4'),
(896, 217, 'reviews_section_header', 'clients says'),
(897, 217, '_reviews_section_header', 'field_5a2fefc2a38f3'),
(898, 5, 'works_section_header', 'best works'),
(899, 5, '_works_section_header', 'field_5a2fef1da38f0'),
(900, 5, 'contacts_section_header', 'get in touch'),
(901, 5, '_contacts_section_header', 'field_5a2fefdfa38f4'),
(902, 5, 'reviews_section_header', 'clients says'),
(903, 5, '_reviews_section_header', 'field_5a2fefc2a38f3'),
(904, 218, 'works_section_header', 'best works'),
(905, 218, '_works_section_header', 'field_5a2fef1da38f0'),
(906, 218, 'services_section_header', 'we do'),
(907, 218, '_services_section_header', 'field_5a2fef33a38f1'),
(908, 218, 'contacts_section_header', ''),
(909, 218, '_contacts_section_header', 'field_5a2fefdfa38f4'),
(910, 218, 'reviews_section_header', 'clients says'),
(911, 218, '_reviews_section_header', 'field_5a2fefc2a38f3'),
(912, 219, 'works_section_header', 'best works'),
(913, 219, '_works_section_header', 'field_5a2fef1da38f0'),
(914, 219, 'services_section_header', 'we do'),
(915, 219, '_services_section_header', 'field_5a2fef33a38f1'),
(916, 219, 'reviews_section_header', 'clients says'),
(917, 219, '_reviews_section_header', 'field_5a2fefc2a38f3'),
(918, 219, 'contacts_section_header', 'get in touch'),
(919, 219, '_contacts_section_header', 'field_5a2fefdfa38f4'),
(920, 220, '_edit_last', '1'),
(921, 220, '_edit_lock', '1513091223:1'),
(922, 222, 'contacts_section_header', 'get in touch'),
(923, 222, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(924, 17, 'contacts_section_header', 'get in touch'),
(925, 17, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(926, 223, '_edit_last', '1'),
(927, 223, '_edit_lock', '1513091377:1'),
(928, 225, 'services_section_header', 'what we do'),
(929, 225, '_services_section_header', 'field_5a2ff13785a08'),
(930, 19, 'services_section_header', 'what we do'),
(931, 19, '_services_section_header', 'field_5a2ff13785a08'),
(932, 226, '_edit_last', '1'),
(933, 226, '_edit_lock', '1513091600:1'),
(934, 228, 'works_section_header', 'our works'),
(935, 228, '_works_section_header', 'field_5a2ff1c9377cc'),
(936, 120, 'works_section_header', 'our works'),
(937, 120, '_works_section_header', 'field_5a2ff1c9377cc'),
(938, 229, '_edit_last', '1'),
(939, 229, '_edit_lock', '1513092543:1'),
(940, 232, 'about_us_section_header', 'about us'),
(941, 232, '_about_us_section_header', 'field_5a2ff2a7354e5'),
(942, 232, '_', 'field_5a2ff2b4354e6'),
(943, 188, 'about_us_section_header', 'about us'),
(944, 188, '_about_us_section_header', 'field_5a2ff2a7354e5'),
(945, 188, '_', 'field_5a2ff2b4354e6'),
(946, 234, 'about_us_section_header', 'about us'),
(947, 234, '_about_us_section_header', 'field_5a2ff2a7354e5'),
(948, 234, 'about_us_subtitle', 'subtitle'),
(949, 234, '_about_us_subtitle', 'field_5a2ff2b4354e6'),
(950, 188, 'about_us_subtitle', 'subtitle'),
(951, 188, '_about_us_subtitle', 'field_5a2ff2b4354e6'),
(952, 188, '_thumbnail_id', '139'),
(953, 235, 'about_us_section_header', 'about us'),
(954, 235, '_about_us_section_header', 'field_5a2ff2a7354e5'),
(955, 235, 'about_us_subtitle', 'subtitle'),
(956, 235, '_about_us_subtitle', 'field_5a2ff2b4354e6'),
(957, 239, 'about_us_section_header', 'about us'),
(958, 239, '_about_us_section_header', 'field_5a2ff2a7354e5'),
(959, 239, 'about_us_subtitle', 'subtitle'),
(960, 239, '_about_us_subtitle', 'field_5a2ff2b4354e6'),
(961, 239, 'reviews_section_header', 'reviews'),
(962, 239, '_reviews_section_header', 'field_5a2ff488ccddb'),
(963, 239, 'contacts_section_header', 'get in touch'),
(964, 239, '_contacts_section_header', 'field_5a2ff4a3427b5'),
(965, 239, 'team_section_header', 'Best Team'),
(966, 239, '_team_section_header', 'field_5a2ff4d18a75e'),
(967, 188, 'reviews_section_header', 'reviews'),
(968, 188, '_reviews_section_header', 'field_5a2ff488ccddb'),
(969, 188, 'contacts_section_header', 'get in touch'),
(970, 188, '_contacts_section_header', 'field_5a2ff4a3427b5'),
(971, 188, 'team_section_header', 'Best Team'),
(972, 188, '_team_section_header', 'field_5a2ff4d18a75e'),
(979, 244, '_form', '<label> Your Name\n    [text* your-name class:w-100 class:contact] </label>\n\n<label> Your Email\n    [email* your-email class:w-100 class:contact] </label>\n\n[submit class:btn class:btn-default class:btn-white "Send" ]'),
(980, 244, '_mail', 'a:9:{s:6:"active";b:1;s:7:"subject";s:22:"clemo "[your-subject]"";s:6:"sender";s:37:"[your-name] <wordpress@139.59.164.52>";s:9:"recipient";s:20:"krforgames@gmail.com";s:4:"body";s:165:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\nEmpty\n\n-- \nThis e-mail was sent from a contact form on clemo (http://139.59.164.52/wordpress)";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(981, 244, '_mail_2', 'a:9:{s:6:"active";b:1;s:7:"subject";s:22:"clemo "[your-subject]"";s:6:"sender";s:31:"clemo <wordpress@139.59.164.52>";s:9:"recipient";s:12:"[your-email]";s:4:"body";s:131:"Hi! You just posted a message for yourself!\n\n-- \nThis e-mail was sent from a contact form on clemo (http://139.59.164.52/wordpress)";s:18:"additional_headers";s:30:"Reply-To: krforgames@gmail.com";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(982, 244, '_messages', 'a:23:{s:12:"mail_sent_ok";s:45:"Thank you for your message. It has been sent.";s:12:"mail_sent_ng";s:71:"There was an error trying to send your message. Please try again later.";s:16:"validation_error";s:61:"One or more fields have an error. Please check and try again.";s:4:"spam";s:71:"There was an error trying to send your message. Please try again later.";s:12:"accept_terms";s:69:"You must accept the terms and conditions before sending your message.";s:16:"invalid_required";s:22:"The field is required.";s:16:"invalid_too_long";s:22:"The field is too long.";s:17:"invalid_too_short";s:23:"The field is too short.";s:12:"invalid_date";s:29:"The date format is incorrect.";s:14:"date_too_early";s:44:"The date is before the earliest one allowed.";s:13:"date_too_late";s:41:"The date is after the latest one allowed.";s:13:"upload_failed";s:46:"There was an unknown error uploading the file.";s:24:"upload_file_type_invalid";s:49:"You are not allowed to upload files of this type.";s:21:"upload_file_too_large";s:20:"The file is too big.";s:23:"upload_failed_php_error";s:38:"There was an error uploading the file.";s:14:"invalid_number";s:29:"The number format is invalid.";s:16:"number_too_small";s:47:"The number is smaller than the minimum allowed.";s:16:"number_too_large";s:46:"The number is larger than the maximum allowed.";s:23:"quiz_answer_not_correct";s:36:"The answer to the quiz is incorrect.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:13:"invalid_email";s:38:"The e-mail address entered is invalid.";s:11:"invalid_url";s:19:"The URL is invalid.";s:11:"invalid_tel";s:32:"The telephone number is invalid.";}'),
(983, 244, '_additional_settings', ''),
(984, 244, '_locale', 'en_US'),
(985, 245, 'contacts_section_header', 'get in touch'),
(986, 245, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(987, 246, 'contacts_section_header', 'get in touch'),
(988, 246, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(989, 247, 'contacts_section_header', 'get in touch'),
(990, 247, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(991, 248, 'contacts_section_header', 'get in touch'),
(992, 248, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(993, 250, 'contacts_section_header', 'get in touch'),
(994, 250, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(995, 251, 'contacts_section_header', 'get in touch'),
(996, 251, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(997, 252, 'contacts_section_header', 'get in touch'),
(998, 252, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(999, 253, 'contacts_section_header', 'get in touch'),
(1000, 253, '_contacts_section_header', 'field_5a2ff0c98b34c'),
(1001, 254, 'works_section_header', 'best works'),
(1002, 254, '_works_section_header', 'field_5a2fef1da38f0'),
(1003, 254, 'services_section_header', 'we do'),
(1004, 254, '_services_section_header', 'field_5a2fef33a38f1'),
(1005, 254, 'reviews_section_header', 'clients says'),
(1006, 254, '_reviews_section_header', 'field_5a2fefc2a38f3'),
(1007, 254, 'contacts_section_header', 'get in touch'),
(1008, 254, '_contacts_section_header', 'field_5a2fefdfa38f4'),
(1009, 255, 'works_section_header', 'best works'),
(1010, 255, '_works_section_header', 'field_5a2fef1da38f0'),
(1011, 255, 'services_section_header', 'we do'),
(1012, 255, '_services_section_header', 'field_5a2fef33a38f1'),
(1013, 255, 'reviews_section_header', 'clients says'),
(1014, 255, '_reviews_section_header', 'field_5a2fefc2a38f3'),
(1015, 255, 'home-contacts_section_header', '123'),
(1016, 255, '_home-contacts_section_header', 'field_5a2fefdfa38f4'),
(1017, 5, 'home-contacts_section_header', 'contact us'),
(1018, 5, '_home-contacts_section_header', 'field_5a2fefdfa38f4'),
(1019, 256, 'works_section_header', 'best works'),
(1020, 256, '_works_section_header', 'field_5a2fef1da38f0'),
(1021, 256, 'services_section_header', 'we do'),
(1022, 256, '_services_section_header', 'field_5a2fef33a38f1'),
(1023, 256, 'reviews_section_header', 'clients says'),
(1024, 256, '_reviews_section_header', 'field_5a2fefc2a38f3'),
(1025, 256, 'home-contacts_section_header', 'contact us'),
(1026, 256, '_home-contacts_section_header', 'field_5a2fefdfa38f4'),
(1030, 201, '_wp_old_slug', '%d0%ba%d0%b5%d0%ba'),
(1031, 259, '_wp_attached_file', '2017/12/Dog-Fathers-Ducklings-200x100.jpg'),
(1032, 259, '_wp_attachment_metadata', 'a:4:{s:5:"width";i:200;s:6:"height";i:100;s:4:"file";s:41:"2017/12/Dog-Fathers-Ducklings-200x100.jpg";s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(1034, 141, 'subtitle', 'subtitle'),
(1035, 141, '_subtitle', 'field_5a23cf41c208a'),
(1036, 141, '_wp_old_slug', 'mmmmm-kaef');

-- --------------------------------------------------------

--
-- Структура таблицы `clm_posts`
--

CREATE TABLE `clm_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clm_posts`
--

INSERT INTO `clm_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2017-12-02 10:45:32', '2017-12-02 10:45:32', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2017-12-10 13:05:34', '2017-12-10 13:05:34', '', 0, 'http://wordpress/?p=1', 0, 'post', '', 2),
(5, 1, '2017-12-02 10:49:42', '2017-12-02 10:49:42', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100"]', 'home', '', 'publish', 'closed', 'closed', '', 'home-2', '', '', '2018-05-30 11:40:55', '2018-05-30 11:40:55', '', 0, 'http://wordpress/?page_id=5', 0, 'page', '', 0),
(6, 1, '2017-12-02 10:49:42', '2017-12-02 10:49:42', '', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-12-02 10:49:42', '2017-12-02 10:49:42', '', 5, 'http://wordpress/2017/12/02/5-revision-v1/', 0, 'revision', '', 0),
(7, 1, '2017-12-02 10:49:50', '2017-12-02 10:49:50', '', 'blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2017-12-02 10:49:50', '2017-12-02 10:49:50', '', 0, 'http://wordpress/?page_id=7', 0, 'page', '', 0),
(8, 1, '2017-12-02 10:49:50', '2017-12-02 10:49:50', '', 'blog', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2017-12-02 10:49:50', '2017-12-02 10:49:50', '', 7, 'http://wordpress/2017/12/02/7-revision-v1/', 0, 'revision', '', 0),
(10, 1, '2017-12-02 11:13:10', '2017-12-02 11:13:10', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:7:"contact";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Contacts', 'contacts', 'publish', 'closed', 'closed', '', 'group_5a228a38c3b69', '', '', '2017-12-08 12:30:48', '2017-12-08 12:30:48', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=10', 0, 'acf-field-group', '', 0),
(12, 1, '2017-12-02 11:13:11', '2017-12-02 11:13:11', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Address', 'contact_address', 'publish', 'closed', 'closed', '', 'field_5a228a6fa30da', '', '', '2017-12-08 12:30:48', '2017-12-08 12:30:48', '', 10, 'http://wordpress/?post_type=acf-field&#038;p=12', 0, 'acf-field', '', 0),
(13, 1, '2017-12-02 11:13:11', '2017-12-02 11:13:11', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Phone Number', 'contact_phone_number', 'publish', 'closed', 'closed', '', 'field_5a228a87a30db', '', '', '2017-12-08 12:30:48', '2017-12-08 12:30:48', '', 10, 'http://wordpress/?post_type=acf-field&#038;p=13', 2, 'acf-field', '', 0),
(14, 1, '2017-12-02 11:13:11', '2017-12-02 11:13:11', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Name Placeholder', 'contact_name_placeholder', 'publish', 'closed', 'closed', '', 'field_5a228a97a30dc', '', '', '2017-12-08 12:30:48', '2017-12-08 12:30:48', '', 10, 'http://wordpress/?post_type=acf-field&#038;p=14', 3, 'acf-field', '', 0),
(15, 1, '2017-12-02 11:13:11', '2017-12-02 11:13:11', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Email Placeholder', 'contact_email_placeholder', 'publish', 'closed', 'closed', '', 'field_5a228aaaa30dd', '', '', '2017-12-08 12:30:48', '2017-12-08 12:30:48', '', 10, 'http://wordpress/?post_type=acf-field&#038;p=15', 4, 'acf-field', '', 0),
(16, 1, '2017-12-02 11:13:11', '2017-12-02 11:13:11', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Map', 'contact_map', 'publish', 'closed', 'closed', '', 'field_5a228ab9a30de', '', '', '2017-12-08 12:30:48', '2017-12-08 12:30:48', '', 10, 'http://wordpress/?post_type=acf-field&#038;p=16', 5, 'acf-field', '', 0),
(17, 1, '2017-12-02 11:13:27', '2017-12-02 11:13:27', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100"]', 'contacts', '', 'publish', 'closed', 'closed', '', 'contacts', '', '', '2018-05-30 11:28:01', '2018-05-30 11:28:01', '', 0, 'http://wordpress/?page_id=17', 0, 'page', '', 0),
(18, 1, '2017-12-02 11:13:27', '2017-12-02 11:13:27', '', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-12-02 11:13:27', '2017-12-02 11:13:27', '', 17, 'http://wordpress/2017/12/02/17-revision-v1/', 0, 'revision', '', 0),
(19, 1, '2017-12-02 11:13:40', '2017-12-02 11:13:40', '', 'services', '', 'publish', 'closed', 'closed', '', 'services', '', '', '2017-12-12 15:10:41', '2017-12-12 15:10:41', '', 0, 'http://wordpress/?page_id=19', 0, 'page', '', 0),
(20, 1, '2017-12-02 11:13:40', '2017-12-02 11:13:40', '', 'services', '', 'inherit', 'closed', 'closed', '', '19-revision-v1', '', '', '2017-12-02 11:13:40', '2017-12-02 11:13:40', '', 19, 'http://wordpress/2017/12/02/19-revision-v1/', 0, 'revision', '', 0),
(22, 1, '2017-12-02 12:28:11', '2017-12-02 12:28:11', '', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-12-02 12:28:11', '2017-12-02 12:28:11', '', 17, 'http://wordpress/2017/12/02/17-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2017-12-02 12:29:13', '2017-12-02 12:29:13', '', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-12-02 12:29:13', '2017-12-02 12:29:13', '', 17, 'http://wordpress/2017/12/02/17-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2017-12-02 12:29:58', '2017-12-02 12:29:58', '', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-12-02 12:29:58', '2017-12-02 12:29:58', '', 17, 'http://wordpress/2017/12/02/17-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2017-12-02 12:31:23', '2017-12-02 12:31:23', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Email', 'contact_email', 'publish', 'closed', 'closed', '', 'field_5a229d0c4b5fd', '', '', '2017-12-08 12:30:48', '2017-12-08 12:30:48', '', 10, 'http://wordpress/?post_type=acf-field&#038;p=25', 1, 'acf-field', '', 0),
(26, 1, '2017-12-02 12:32:21', '2017-12-02 12:32:21', '', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-12-02 12:32:21', '2017-12-02 12:32:21', '', 17, 'http://wordpress/2017/12/02/17-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2017-12-02 12:40:11', '2017-12-02 12:40:11', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:13:"carousel_team";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Team', 'team', 'publish', 'closed', 'closed', '', 'group_5a229eb845240', '', '', '2017-12-02 12:43:55', '2017-12-02 12:43:55', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=28', 0, 'acf-field-group', '', 0),
(30, 1, '2017-12-02 12:40:11', '2017-12-02 12:40:11', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Position', 'member_position', 'publish', 'closed', 'closed', '', 'field_5a229eed966a2', '', '', '2017-12-02 12:43:55', '2017-12-02 12:43:55', '', 28, 'http://wordpress/?post_type=acf-field&#038;p=30', 0, 'acf-field', '', 0),
(31, 1, '2017-12-02 12:40:11', '2017-12-02 12:40:11', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:5:"array";s:12:"preview_size";s:9:"thumbnail";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Photo', 'member_photo', 'publish', 'closed', 'closed', '', 'field_5a229f05966a3', '', '', '2017-12-02 12:43:55', '2017-12-02 12:43:55', '', 28, 'http://wordpress/?post_type=acf-field&#038;p=31', 1, 'acf-field', '', 0),
(32, 1, '2017-12-02 12:42:48', '2017-12-02 12:42:48', '', 'Nikola Tesla', '', 'publish', 'closed', 'closed', '', 'nikola', '', '', '2017-12-02 12:44:20', '2017-12-02 12:44:20', '', 0, 'http://wordpress/?post_type=carousel_team&#038;p=32', 0, 'carousel_team', '', 0),
(33, 1, '2017-12-02 12:42:37', '2017-12-02 12:42:37', '', 'NikolaTesla', '', 'inherit', 'open', 'closed', '', 'nikolatesla', '', '', '2017-12-02 12:42:45', '2017-12-02 12:42:45', '', 32, 'http://wordpress/wp-content/uploads/2017/12/NikolaTesla.jpg', 0, 'attachment', 'image/jpeg', 0),
(35, 1, '2017-12-02 12:46:56', '2017-12-02 12:46:56', '', 'Rick', '', 'publish', 'closed', 'closed', '', 'rick', '', '', '2017-12-02 12:46:56', '2017-12-02 12:46:56', '', 0, 'http://wordpress/?post_type=carousel_team&#038;p=35', 0, 'carousel_team', '', 0),
(36, 1, '2017-12-02 12:46:41', '2017-12-02 12:46:41', '', 'Rick face', '', 'inherit', 'open', 'closed', '', 'rick_face', '', '', '2017-12-02 12:46:54', '2017-12-02 12:46:54', '', 35, 'http://wordpress/wp-content/uploads/2017/12/rick_face.png', 0, 'attachment', 'image/png', 0),
(38, 1, '2017-12-02 12:53:44', '2017-12-02 12:53:44', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:6:"skills";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Skills', 'skills', 'publish', 'closed', 'closed', '', 'group_5a22a1e75f7e5', '', '', '2017-12-02 13:01:33', '2017-12-02 13:01:33', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=38', 0, 'acf-field-group', '', 0),
(40, 1, '2017-12-02 12:53:44', '2017-12-02 12:53:44', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Text', 'skill_text', 'publish', 'closed', 'closed', '', 'field_5a22a2088c8b1', '', '', '2017-12-02 13:01:33', '2017-12-02 13:01:33', '', 38, 'http://wordpress/?post_type=acf-field&#038;p=40', 0, 'acf-field', '', 0),
(41, 1, '2017-12-02 12:53:44', '2017-12-02 12:53:44', 'a:7:{s:4:"type";s:10:"true_false";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"message";s:0:"";s:13:"default_value";i:0;}', 'Add a button?', 'skill_add_a_button', 'publish', 'closed', 'closed', '', 'field_5a22a2178c8b2', '', '', '2017-12-02 13:01:33', '2017-12-02 13:01:33', '', 38, 'http://wordpress/?post_type=acf-field&#038;p=41', 1, 'acf-field', '', 0),
(42, 1, '2017-12-02 12:53:44', '2017-12-02 12:53:44', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5a22a2178c8b2";s:8:"operator";s:2:"==";s:5:"value";s:1:"1";}}}}', 'Button Text', 'skill_button_text', 'publish', 'closed', 'closed', '', 'field_5a22a2428c8b3', '', '', '2017-12-02 13:01:33', '2017-12-02 13:01:33', '', 38, 'http://wordpress/?post_type=acf-field&#038;p=42', 2, 'acf-field', '', 0),
(43, 1, '2017-12-02 12:55:19', '2017-12-02 12:55:19', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5a22a2178c8b2";s:8:"operator";s:2:"==";s:5:"value";s:1:"1";}}}}', 'Button Link', 'skill_button_link', 'publish', 'closed', 'closed', '', 'field_5a22a298d35b3', '', '', '2017-12-02 13:01:33', '2017-12-02 13:01:33', '', 38, 'http://wordpress/?post_type=acf-field&#038;p=43', 3, 'acf-field', '', 0),
(45, 1, '2017-12-02 12:57:19', '2017-12-02 12:57:19', '', 'we are clemo', '', 'publish', 'closed', 'closed', '', 'we-are-clemo', '', '', '2017-12-02 13:02:33', '2017-12-02 13:02:33', '', 0, 'http://wordpress/?post_type=skills&#038;p=45', 0, 'skills', '', 0),
(48, 1, '2017-12-02 13:02:22', '2017-12-02 13:02:22', '', 'any party', '', 'publish', 'closed', 'closed', '', 'any-party', '', '', '2017-12-02 13:02:22', '2017-12-02 13:02:22', '', 0, 'http://wordpress/?post_type=skills&#038;p=48', 0, 'skills', '', 0),
(49, 1, '2017-12-02 13:15:31', '2017-12-02 13:15:31', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:7:"service";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";a:1:{i:0;s:13:"custom_fields";}s:11:"description";s:0:"";}', 'Services', 'services', 'publish', 'closed', 'closed', '', 'group_5a22a53a176de', '', '', '2017-12-02 20:24:34', '2017-12-02 20:24:34', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=49', 0, 'acf-field-group', '', 0),
(51, 1, '2017-12-02 13:15:31', '2017-12-02 13:15:31', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Subtitle', 'service_subtitle', 'publish', 'closed', 'closed', '', 'field_5a22a6f3b2eeb', '', '', '2017-12-02 13:16:31', '2017-12-02 13:16:31', '', 49, 'http://wordpress/?post_type=acf-field&#038;p=51', 0, 'acf-field', '', 0),
(54, 1, '2017-12-02 13:15:31', '2017-12-02 13:15:31', 'a:7:{s:4:"type";s:10:"true_false";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"message";s:0:"";s:13:"default_value";i:0;}', 'Add a button?', 'service_add_a_button', 'publish', 'closed', 'closed', '', 'field_5a22a730b2eee', '', '', '2017-12-02 20:24:34', '2017-12-02 20:24:34', '', 49, 'http://wordpress/?post_type=acf-field&#038;p=54', 1, 'acf-field', '', 0),
(55, 1, '2017-12-02 13:15:31', '2017-12-02 13:15:31', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5a22a730b2eee";s:8:"operator";s:2:"==";s:5:"value";s:1:"1";}}}}', 'Button Text', 'service_button_text', 'publish', 'closed', 'closed', '', 'field_5a22a74eb2eef', '', '', '2017-12-02 20:24:34', '2017-12-02 20:24:34', '', 49, 'http://wordpress/?post_type=acf-field&#038;p=55', 2, 'acf-field', '', 0),
(56, 1, '2017-12-02 13:15:31', '2017-12-02 13:15:31', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5a22a730b2eee";s:8:"operator";s:2:"==";s:5:"value";s:1:"1";}}}}', 'Button Link', 'service_button_link', 'publish', 'closed', 'closed', '', 'field_5a22a75bb2ef0', '', '', '2017-12-02 20:24:34', '2017-12-02 20:24:34', '', 49, 'http://wordpress/?post_type=acf-field&#038;p=56', 3, 'acf-field', '', 0),
(61, 1, '2017-12-02 13:17:48', '2017-12-02 13:17:48', '<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. <!--more-->It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'lorem ipsum', '', 'publish', 'closed', 'closed', '', '61', '', '', '2017-12-03 23:13:37', '2017-12-03 23:13:37', '', 0, 'http://wordpress/?post_type=service&#038;p=61', 0, 'service', '', 0),
(62, 1, '2017-12-02 13:17:58', '2017-12-02 13:17:58', '', 'original', '', 'inherit', 'open', 'closed', '', 'original', '', '', '2017-12-03 10:04:47', '2017-12-03 10:04:47', '', 61, 'http://wordpress/wp-content/uploads/2017/12/original.jpg', 0, 'attachment', 'image/jpeg', 0),
(63, 1, '2017-12-02 13:21:08', '2017-12-02 13:21:08', 'Pizza is a yeasted flatbread typically topped with tomato sauce and cheese and baked in an oven. It is commonly topped with a selection of meats, vegetables and condiments.\r\n\r\nThe term pizza was first recorded in the 10th century, in a Latin manuscript from Gaeta in Southern Lazio on the border with Campania.<!--more--> Modern pizza was invented in Naples, Campania, Southern Italy, and the dish and its variants have since become popular and common in many areas of the world. In 2009, upon Italy\'s request, Neapolitan pizza was safeguarded in the European Union as a Traditional Speciality Guaranteed dish. Associazione Verace Pizza Napoletana (True Neapolitan Pizza Association), a non-profit organization founded in 1984 with headquarters in Naples, aims to "promote and protect... the true Neapolitan pizza".\r\n\r\nPizza is sold fresh or frozen, either whole or in portions, and is a common fast food item in Europe and North America. Various types of ovens are used to cook them and many varieties exist. Several similar dishes are prepared from ingredients commonly used in pizza preparation, such as calzone and stromboli.', 'favorite pizza', '', 'publish', 'closed', 'closed', '', '63', '', '', '2017-12-03 23:13:13', '2017-12-03 23:13:13', '', 0, 'http://wordpress/?post_type=service&#038;p=63', 0, 'service', '', 0),
(64, 1, '2017-12-02 13:21:51', '2017-12-02 13:21:51', '', 'pizza', '', 'inherit', 'open', 'closed', '', 'pizza', '', '', '2017-12-02 13:22:01', '2017-12-02 13:22:01', '', 63, 'http://wordpress/wp-content/uploads/2017/12/pizza.jpg', 0, 'attachment', 'image/jpeg', 0),
(66, 1, '2017-12-02 13:24:34', '2017-12-02 13:24:34', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. <!--more-->It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'wedding organization', '', 'publish', 'closed', 'closed', '', 'wedding-organization', '', '', '2017-12-03 23:11:57', '2017-12-03 23:11:58', '', 0, 'http://wordpress/?post_type=service&#038;p=66', 0, 'service', '', 0),
(67, 1, '2017-12-02 13:25:42', '2017-12-02 13:25:42', '', 'wedding', '', 'inherit', 'open', 'closed', '', 'wedding', '', '', '2017-12-02 13:25:45', '2017-12-02 13:25:45', '', 66, 'http://wordpress/wp-content/uploads/2017/12/wedding.jpg', 0, 'attachment', 'image/jpeg', 0),
(69, 1, '2017-12-08 12:05:37', '2017-12-08 12:05:37', '', 'hungry girl', '', 'publish', 'closed', 'closed', '', 'kharlan', '', '', '2018-05-30 09:59:31', '2018-05-30 09:59:31', '', 0, 'http://wordpress/?post_type=carousel_team&#038;p=69', 0, 'carousel_team', '', 0),
(70, 1, '2017-12-02 14:06:34', '2017-12-02 14:06:34', '', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-12-02 14:06:34', '2017-12-02 14:06:34', '', 17, 'http://wordpress/17-revision-v1/', 0, 'revision', '', 0),
(71, 1, '2017-12-02 14:09:12', '2017-12-02 14:09:12', '', 'our contacts', '', 'publish', 'closed', 'closed', '', '1', '', '', '2018-05-30 11:31:58', '2018-05-30 11:31:58', '', 0, 'http://wordpress/?post_type=contact&#038;p=71', 0, 'contact', '', 0),
(72, 1, '2017-12-02 14:22:01', '2017-12-02 14:22:01', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:4:"work";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Works', 'works', 'publish', 'closed', 'closed', '', 'group_5a22b67ee9ca1', '', '', '2017-12-03 23:18:59', '2017-12-03 23:18:59', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=72', 0, 'acf-field-group', '', 0),
(80, 1, '2017-12-02 14:23:41', '2017-12-02 14:23:41', '', 'intergalactic journey', '', 'inherit', 'open', 'closed', '', '21rickmorty', '', '', '2017-12-02 14:24:29', '2017-12-02 14:24:29', '', 0, 'http://wordpress/wp-content/uploads/2017/12/21rickmorty.jpg', 0, 'attachment', 'image/jpeg', 0),
(81, 1, '2017-12-02 14:25:06', '2017-12-02 14:25:06', '', 'Fire event', '', 'inherit', 'open', 'closed', '', 'rick-and-morty-rickstaverse-2', '', '', '2017-12-02 14:25:42', '2017-12-02 14:25:42', '', 0, 'http://wordpress/wp-content/uploads/2017/12/Rick-and-Morty-Rickstaverse-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(82, 1, '2017-12-02 14:39:26', '2017-12-02 14:39:26', '', 'wide', '', 'inherit', 'open', 'closed', '', 'rick_and_morty_april_fools', '', '', '2017-12-02 14:40:19', '2017-12-02 14:40:19', '', 0, 'http://wordpress/wp-content/uploads/2017/12/rick_and_morty_april_fools.jpg', 0, 'attachment', 'image/jpeg', 0),
(83, 1, '2017-12-02 14:40:29', '2017-12-02 14:40:29', '', 'drunk', '', 'inherit', 'open', 'closed', '', 'ram_pilot', '', '', '2017-12-03 18:52:37', '2017-12-03 18:52:37', '', 0, 'http://wordpress/wp-content/uploads/2017/12/RAM_Pilot.jpg', 0, 'attachment', 'image/jpeg', 0),
(84, 1, '2017-12-02 14:42:57', '2017-12-02 14:42:57', '', 'wars', '', 'inherit', 'open', 'closed', '', 'a2m8kv9', '', '', '2017-12-02 14:43:07', '2017-12-02 14:43:07', '', 0, 'http://wordpress/wp-content/uploads/2017/12/a2m8kV9.png', 0, 'attachment', 'image/png', 0),
(85, 1, '2017-12-02 14:43:49', '2017-12-02 14:43:49', '', 'design', '', 'inherit', 'open', 'closed', '', 'screenshot', '', '', '2017-12-02 14:44:03', '2017-12-02 14:44:03', '', 0, 'http://wordpress/wp-content/uploads/2017/12/screenshot.png', 0, 'attachment', 'image/png', 0),
(86, 1, '2017-12-02 15:01:12', '2017-12-02 15:01:12', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:7:"reviews";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";a:1:{i:0;s:11:"the_content";}s:11:"description";s:0:"";}', 'Reviews', 'reviews', 'publish', 'closed', 'closed', '', 'group_5a22bf2462ead', '', '', '2017-12-04 21:32:18', '2017-12-04 21:32:18', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=86', 0, 'acf-field-group', '', 0),
(88, 1, '2017-12-02 15:01:12', '2017-12-02 15:01:12', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Position', 'review_position', 'publish', 'closed', 'closed', '', 'field_5a22bfeb2b581', '', '', '2017-12-04 21:32:18', '2017-12-04 21:32:18', '', 86, 'http://wordpress/?post_type=acf-field&#038;p=88', 0, 'acf-field', '', 0),
(89, 1, '2017-12-02 15:01:12', '2017-12-02 15:01:12', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:7:"wpautop";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Text', 'review_text', 'publish', 'closed', 'closed', '', 'field_5a22bff52b582', '', '', '2017-12-04 21:32:18', '2017-12-04 21:32:18', '', 86, 'http://wordpress/?post_type=acf-field&#038;p=89', 1, 'acf-field', '', 0),
(90, 1, '2017-12-02 15:01:12', '2017-12-02 15:01:12', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:5:"array";s:12:"preview_size";s:9:"thumbnail";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Photo', 'review_photo', 'publish', 'closed', 'closed', '', 'field_5a22bffc2b583', '', '', '2017-12-04 21:32:18', '2017-12-04 21:32:18', '', 86, 'http://wordpress/?post_type=acf-field&#038;p=90', 2, 'acf-field', '', 0),
(92, 1, '2017-12-02 15:02:53', '2017-12-02 15:02:53', '', 'dude with a beard', '', 'publish', 'closed', 'closed', '', 'beard', '', '', '2017-12-04 21:32:03', '2017-12-04 21:32:03', '', 0, 'http://wordpress/?post_type=reviews&#038;p=92', 0, 'reviews', '', 0),
(93, 1, '2017-12-02 15:02:27', '2017-12-02 15:02:27', '', 'beard', 'bearded man', 'inherit', 'open', 'closed', '', 'aj', '', '', '2017-12-02 15:26:12', '2017-12-02 15:26:12', '', 92, 'http://wordpress/wp-content/uploads/2017/12/aj.png', 0, 'attachment', 'image/png', 0),
(94, 1, '2017-12-02 16:48:28', '2017-12-02 16:48:28', '', 'donald trump', '', 'publish', 'closed', 'closed', '', '94', '', '', '2017-12-04 21:32:08', '2017-12-04 21:32:08', '', 0, 'http://wordpress/?post_type=reviews&#038;p=94', 0, 'reviews', '', 0),
(95, 1, '2017-12-02 16:45:59', '2017-12-02 16:45:59', '', 'trump', '', 'inherit', 'open', 'closed', '', 'trump', '', '', '2017-12-02 16:46:05', '2017-12-02 16:46:05', '', 94, 'http://wordpress/wp-content/uploads/2017/12/trump.jpg', 0, 'attachment', 'image/jpeg', 0),
(96, 1, '2017-12-02 17:36:27', '2017-12-02 17:36:27', '', 'elon musk', '', 'publish', 'closed', 'closed', '', '96', '', '', '2017-12-04 21:31:47', '2017-12-04 21:31:47', '', 0, 'http://wordpress/?post_type=reviews&#038;p=96', 0, 'reviews', '', 0),
(97, 1, '2017-12-02 17:36:17', '2017-12-02 17:36:17', '', 'Elon Musk', '', 'inherit', 'open', 'closed', '', 'elon_musk_2015', '', '', '2017-12-02 17:36:25', '2017-12-02 17:36:25', '', 96, 'http://wordpress/wp-content/uploads/2017/12/Elon_Musk_2015.jpg', 0, 'attachment', 'image/jpeg', 0),
(98, 1, '2017-12-02 17:39:05', '2017-12-02 17:39:05', '', 'Homunculus loxodontus', '', 'publish', 'closed', 'closed', '', '98', '', '', '2017-12-04 21:31:53', '2017-12-04 21:31:53', '', 0, 'http://wordpress/?post_type=reviews&#038;p=98', 0, 'reviews', '', 0),
(99, 1, '2017-12-02 17:38:43', '2017-12-02 17:38:43', '', 'zhdun', '', 'inherit', 'open', 'closed', '', 'zhdun', '', '', '2017-12-02 17:38:46', '2017-12-02 17:38:46', '', 98, 'http://wordpress/wp-content/uploads/2017/12/zhdun.jpg', 0, 'attachment', 'image/jpeg', 0),
(100, 1, '2017-12-02 20:21:54', '2017-12-02 20:21:54', 'Pizza is a yeasted flatbread typically topped with tomato sauce and cheese and baked in an oven. It is commonly topped with a selection of meats, vegetables and condiments.\n\nThe term pizza was first recorded in the 10th century, in a Latin manuscript from Gaeta in Southern Lazio on the border with Campania.<!--more--> Modern pizza was invented in Naples, Campania, Southern Italy, and the dish and its variants have since become popular and common in many areas of the world. In 2009, upon Italy\'s request, Neapolitan pizza was safeguarded in the European Union as a Traditional Speciality Guaranteed dish. Associazione Verace Pizza Napoletana (True Neapolitan Pizza Association), a non-profit organization founded in 1984 with headquarters in Naples, aims to "promote and protect... the true Neapolitan pizza".\n\nPizza is sold fresh or frozen, either whole or in portions, and is a common fast food item in Europe and North America. Various types of ovens are used to cook them and many varieties exist. Several similar dishes are prepared from ingredients commonly used in pizza preparation, such as calzone and stromboli.', 'pizza', '', 'inherit', 'closed', 'closed', '', '63-autosave-v1', '', '', '2017-12-02 20:21:54', '2017-12-02 20:21:54', '', 63, 'http://wordpress/63-autosave-v1/', 0, 'revision', '', 0),
(104, 1, '2017-12-02 20:33:50', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-12-02 20:33:50', '0000-00-00 00:00:00', '', 0, 'http://wordpress/?p=104', 1, 'nav_menu_item', '', 0),
(106, 1, '2017-12-02 21:05:03', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-12-02 21:05:03', '0000-00-00 00:00:00', '', 0, 'http://wordpress/?p=106', 1, 'nav_menu_item', '', 0),
(111, 1, '2017-12-02 21:07:02', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-12-02 21:07:02', '0000-00-00 00:00:00', '', 0, 'http://wordpress/?p=111', 1, 'nav_menu_item', '', 0),
(112, 1, '2017-12-02 21:07:03', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-12-02 21:07:03', '0000-00-00 00:00:00', '', 0, 'http://wordpress/?p=112', 1, 'nav_menu_item', '', 0),
(113, 1, '2017-12-02 21:07:03', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-12-02 21:07:03', '0000-00-00 00:00:00', '', 0, 'http://wordpress/?p=113', 1, 'nav_menu_item', '', 0),
(114, 1, '2017-12-02 21:07:03', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-12-02 21:07:03', '0000-00-00 00:00:00', '', 0, 'http://wordpress/?p=114', 1, 'nav_menu_item', '', 0),
(115, 1, '2017-12-02 21:07:03', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-12-02 21:07:03', '0000-00-00 00:00:00', '', 0, 'http://wordpress/?p=115', 1, 'nav_menu_item', '', 0),
(116, 1, '2017-12-02 21:07:30', '2017-12-02 21:07:30', ' ', '', '', 'publish', 'closed', 'closed', '', '116', '', '', '2017-12-12 15:31:43', '2017-12-12 15:31:43', '', 0, 'http://wordpress/?p=116', 3, 'nav_menu_item', '', 0),
(117, 1, '2017-12-02 21:07:30', '2017-12-02 21:07:30', ' ', '', '', 'publish', 'closed', 'closed', '', '117', '', '', '2017-12-12 15:31:43', '2017-12-12 15:31:43', '', 0, 'http://wordpress/?p=117', 6, 'nav_menu_item', '', 0),
(118, 1, '2017-12-02 21:07:30', '2017-12-02 21:07:30', ' ', '', '', 'publish', 'closed', 'closed', '', '118', '', '', '2017-12-12 15:31:43', '2017-12-12 15:31:43', '', 0, 'http://wordpress/?p=118', 5, 'nav_menu_item', '', 0),
(119, 1, '2017-12-02 21:07:30', '2017-12-02 21:07:30', ' ', '', '', 'publish', 'closed', 'closed', '', '119', '', '', '2017-12-12 15:31:43', '2017-12-12 15:31:43', '', 0, 'http://wordpress/?p=119', 1, 'nav_menu_item', '', 0),
(120, 1, '2017-12-03 10:02:04', '2017-12-03 10:02:04', '', 'works', '', 'publish', 'closed', 'closed', '', 'works', '', '', '2017-12-12 15:13:49', '2017-12-12 15:13:49', '', 0, 'http://wordpress/?page_id=120', 0, 'page', '', 0),
(121, 1, '2017-12-03 10:02:04', '2017-12-03 10:02:04', ' ', '', '', 'publish', 'closed', 'closed', '', '121', '', '', '2017-12-12 15:31:43', '2017-12-12 15:31:43', '', 0, 'http://wordpress/121/', 4, 'nav_menu_item', '', 0),
(122, 1, '2017-12-03 10:02:04', '2017-12-03 10:02:04', '', 'works', '', 'inherit', 'closed', 'closed', '', '120-revision-v1', '', '', '2017-12-03 10:02:04', '2017-12-03 10:02:04', '', 120, 'http://wordpress/120-revision-v1/', 0, 'revision', '', 0),
(127, 1, '2017-12-03 10:18:28', '2017-12-03 10:18:28', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Description', 'subtitle', 'publish', 'closed', 'closed', '', 'field_5a23cf41c208a', '', '', '2017-12-03 23:18:59', '2017-12-03 23:18:59', '', 72, 'http://wordpress/?post_type=acf-field&#038;p=127', 0, 'acf-field', '', 0),
(129, 1, '2017-12-03 10:21:56', '2017-12-03 10:21:56', 'before they sold out hoodie Wes Anderson Tumblr sriracha salvia banjo banh mi post-ironic keytar distillery keffiyeh hella mumblecore umami Austin stumptown leggings lo-fi YOLO beard try-hard Marfa drinking vinegar cray kale chips gastropub selfies locavore put a bird on it vegan direct trade fap flexitarian four loko pork belly tattooed dreamcatcher crucifix whatever pour-over farm-to-table master cleanse wolf you probably haven\'t heard of them paleo meggings sustainable <!--more-->Banksy +1 hashtag plaid cred bitters Pitchfork fingerstache single-origin coffee squid Vice butcher lomo synth Brooklyn disrupt irony tousled Neutra pop-up McSweeney\'s actually mixtape sartorial occupy cornhole Thundercats letterpress semiotics ennui heirloom small batch typewriter gentrify church-key freegan roof party kitsch Kickstarter retro wayfarers kogi aesthetic Bushwick twee literally swag chambray photo booth PBR&amp;B Helvetica readymade mustache mlkshk XOXO iPhone shabby chic tote bag fashion axe Schlitz craft beer artisan organic trust fund vinyl Truffaut meh next level yr street art polaroid DIY brunch Shoreditch American Apparel ethical normcore PBR\r\n\r\n[gallery ids="81,83,82,80,36,84"]', 'first work', '', 'publish', 'closed', 'closed', '', 'first-work', '', '', '2017-12-03 22:47:23', '2017-12-03 22:47:23', '', 0, 'http://wordpress/?post_type=work&#038;p=129', 0, 'work', '', 0),
(130, 1, '2017-12-03 10:38:44', '2017-12-03 10:38:44', 'Spider-Man is one of the most popular characters in comic book history. And across all the films, comics, TV shows and games we’ve seen hundreds of different looks for the wall-crawler. Some have become just as iconic as the original red and blue costume, like Miles Morales’ red and black suit. In each of the movies, we’ve seen Peter designing his new costume or tinkering with his current one. Because of the type of hero that he is, artists have a lot of free rein with the character. Comics gave us the Symbiote black suit, the Iron Spider costume and then there’s the Spider-Verse, in which resides hundreds of different versions of our friendly neighborhood Spider-Man, some great and some not so much.', 'spider man fans meeting', '', 'publish', 'closed', 'closed', '', 'spider-man-fans-meeting', '', '', '2017-12-04 07:39:36', '2017-12-04 07:39:36', '', 0, 'http://wordpress/?post_type=work&#038;p=130', 0, 'work', '', 0),
(131, 1, '2017-12-03 10:37:48', '2017-12-03 10:37:48', 'Workers wearing Spider-ManWorkers wearing Spider-Man', 'spiderman', 'Workers wearing Spider-Man', 'inherit', 'open', 'closed', '', 'spiderman', '', '', '2017-12-03 22:46:11', '2017-12-03 22:46:11', '', 130, 'http://wordpress/wp-content/uploads/2017/12/spiderman.jpg', 0, 'attachment', 'image/jpeg', 0),
(132, 1, '2017-12-03 10:37:49', '2017-12-03 10:37:49', '', 'SpiderManfans', '', 'inherit', 'open', 'closed', '', 'spidermanfans', '', '', '2017-12-03 10:38:08', '2017-12-03 10:38:08', '', 130, 'http://wordpress/wp-content/uploads/2017/12/SpiderManfans.jpg', 0, 'attachment', 'image/jpeg', 0),
(134, 1, '2017-12-03 10:38:37', '2017-12-03 10:38:37', '', 'smfans', '', 'inherit', 'open', 'closed', '', 'smfans', '', '', '2017-12-03 10:38:37', '2017-12-03 10:38:37', '', 130, 'http://wordpress/wp-content/uploads/2017/12/smfans.jpg', 0, 'attachment', 'image/jpeg', 0),
(135, 1, '2017-12-03 18:41:56', '2017-12-03 18:41:56', 'in India perform traditional fire dances as part of the Spring festival. Fire dancing is performed to music played on drums and the behr. There are variations of the fire dancing; men often perform a dance that involves walking on hot coals.A large fire is created and allowed to burn down until it is a pit of glowing embers.<!--more--> The performers then jump in and out of the pit kicking up the embers to create showers of sparks while women perform a dance while balancing flaming tin pots on their heads. Today this ritual is often performed for tourists.\r\n\r\n[gallery ids="139,138,136"]', 'fire performance', '', 'publish', 'closed', 'closed', '', 'fire-performance', '', '', '2017-12-03 22:45:00', '2017-12-03 22:45:00', '', 0, 'http://wordpress/?post_type=work&#038;p=135', 0, 'work', '', 0),
(136, 1, '2017-12-03 18:41:16', '2017-12-03 18:41:16', '', 'centara', '', 'inherit', 'open', 'closed', '', 'centara', '', '', '2017-12-03 18:41:16', '2017-12-03 18:41:16', '', 135, 'http://wordpress/wp-content/uploads/2017/12/centara.jpg', 0, 'attachment', 'image/jpeg', 0),
(137, 1, '2017-12-03 18:41:24', '2017-12-03 18:41:24', '', 'centara', '', 'inherit', 'open', 'closed', '', 'centara-2', '', '', '2017-12-03 18:41:26', '2017-12-03 18:41:26', '', 135, 'http://wordpress/wp-content/uploads/2017/12/centara-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(138, 1, '2017-12-03 18:41:30', '2017-12-03 18:41:30', '', 'fireshow1', '', 'inherit', 'open', 'closed', '', 'fireshow1', '', '', '2017-12-03 18:41:32', '2017-12-03 18:41:32', '', 135, 'http://wordpress/wp-content/uploads/2017/12/fireshow1.jpg', 0, 'attachment', 'image/jpeg', 0),
(139, 1, '2017-12-03 18:41:37', '2017-12-03 18:41:37', '', 'fireshow2', '', 'inherit', 'open', 'closed', '', 'fireshow2', '', '', '2017-12-03 18:41:38', '2017-12-03 18:41:38', '', 135, 'http://wordpress/wp-content/uploads/2017/12/fireshow2.jpg', 0, 'attachment', 'image/jpeg', 0),
(140, 1, '2017-12-03 18:50:26', '2017-12-03 18:50:26', 'another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work<!--more--> another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work another work', 'another work', '', 'publish', 'closed', 'closed', '', 'another-work', '', '', '2017-12-03 18:50:46', '2017-12-03 18:50:46', '', 0, 'http://wordpress/?post_type=work&#038;p=140', 0, 'work', '', 0),
(141, 1, '2016-11-02 18:52:44', '2016-11-02 18:52:44', 'Nearby Mount Vesuvius erupted in 79 AD, killing many Pompeii residents and famously freezing them in place.This skeleton appears to be from a man who survived the initial explosion and was fleeing the doomed city.A leg injury, <!--more-->however, may have slowed him down before he was crushed by the huge stone hurtling through the air.Pompeii archaeologists say the skeleton shows signs of a bone infection in his leg, which could have made walking - much less running - very difficult.\r\n<ul class="story-body__unordered-list">\r\n 	<li class="story-body__list-item"><a class="story-body__link" href="http://www.bbc.com/news/magazine-20407286">Pompeii\'s not-so-ancient Roman remains</a></li>\r\n 	<li class="story-body__list-item"><a class="story-body__link" href="http://www.bbc.com/news/world-europe-33677957">Pompeii guard dog mosaic back on show</a></li>\r\n</ul>', 'news', '', 'publish', 'closed', 'closed', '', 'news', '', '', '2018-05-30 11:49:17', '2018-05-30 11:49:17', '', 0, 'http://wordpress/?post_type=work&#038;p=141', 0, 'work', '', 0),
(142, 1, '2017-12-03 18:55:53', '2017-12-03 18:55:53', 'LIVE. Watch the keynotes and all technical sessions LIVE on the event website or by joining a GDD India Extended event in your area. Session recordings will be published on the Google <em>Developers</em>India YouTube channel after the event. Watch liveLIVE. Watch the keynotes and all technical sessions <!--more-->LIVE on the event website or by joining a GDD India Extended event in your area. Session recordings will be published on the Google <em>Developers</em>India YouTube channel after the event. Watch liveLIVE. Watch the keynotes and all technical sessions LIVE on the event website or by joining a GDD India Extended event in your area. Session recordings will be published on the Google <em>Developers</em>India YouTube channel after the event. Watch live\r\n\r\n[gallery ids="143"]', 'developers meeting', '', 'publish', 'closed', 'closed', '', 'developers-meeting', '', '', '2017-12-03 22:44:13', '2017-12-03 22:44:13', '', 0, 'http://wordpress/?post_type=work&#038;p=142', 0, 'work', '', 0),
(143, 1, '2017-12-03 18:55:31', '2017-12-03 18:55:31', '', 'Developers', '', 'inherit', 'open', 'closed', '', 'developers', '', '', '2017-12-03 18:55:49', '2017-12-03 18:55:49', '', 142, 'http://wordpress/wp-content/uploads/2017/12/Developers.jpg', 0, 'attachment', 'image/jpeg', 0),
(144, 1, '2017-12-03 18:58:09', '2017-12-03 18:58:09', 'I have several home office users that connect via VPN from their laptops. Then can connect if a call is placed directly to them, but not if a meeting request is sent via Lync. After excepting the invitation they click on the meeting link in their calendar and IE opens and says page cannot be displayed. Is there a setting I can change to allow them to connect via a meeting request in their calendar?\r\n\r\nThank you.\r\n\r\n[Best_Wordpress_Gallery id="3" gal_title="vpn"]', 'secret vpn meeting', '', 'publish', 'closed', 'closed', '', 'meeting-of-experts-in-the-field-of-vpn', '', '', '2018-05-30 11:47:01', '2018-05-30 11:47:01', '', 0, 'http://wordpress/?post_type=work&#038;p=144', 0, 'work', '', 0),
(145, 1, '2017-12-03 18:58:05', '2017-12-03 18:58:05', '', 'hacker', '', 'inherit', 'open', 'closed', '', 'hacker', '', '', '2017-12-03 18:58:05', '2017-12-03 18:58:05', '', 144, 'http://wordpress/wp-content/uploads/2017/12/hacker.jpg', 0, 'attachment', 'image/jpeg', 0),
(147, 1, '2017-12-04 07:44:21', '2017-12-04 07:44:21', 'I have several home office users that connect via VPN from their laptops. Then can connect if a call is placed directly to them, but not if a meeting request is sent via Lync. After excepting the invitation they click on the meeting link in their calendar and IE opens and says page cannot be displayed. Is there a setting I can change to allow them to connect via a meeting request in their calendar?\n\nThank you.\n\n&nbsp;\n\n[Best_Wordpress_Gallery id="1" gal_title="All Galleries"]', 'meeting of experts in the field of vpn', '', 'inherit', 'closed', 'closed', '', '144-autosave-v1', '', '', '2017-12-04 07:44:21', '2017-12-04 07:44:21', '', 144, 'http://wordpress/144-autosave-v1/', 0, 'revision', '', 0),
(155, 1, '2017-12-03 23:01:16', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:01:16', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=155', 0, 'ngg_gallery', '', 0),
(156, 1, '2017-12-03 23:01:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:01:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=156', 0, 'ngg_pictures', '', 0),
(157, 1, '2017-12-03 23:01:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:01:17', '2017-12-03 23:01:17', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=157', 0, 'ngg_pictures', '', 0),
(158, 1, '2017-12-03 23:01:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:01:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=158', 0, 'ngg_gallery', '', 0),
(159, 1, '2017-12-03 23:01:18', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:01:18', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=159', 0, 'ngg_pictures', '', 0),
(160, 1, '2017-12-03 23:01:19', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:01:19', '2017-12-03 23:01:19', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=160', 0, 'ngg_pictures', '', 0),
(161, 1, '2017-12-03 23:07:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:07:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=161', 0, 'ngg_gallery', '', 0),
(162, 1, '2017-12-03 23:07:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:07:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=162', 0, 'ngg_pictures', '', 0),
(163, 1, '2017-12-03 23:09:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:09:17', '2017-12-03 23:09:17', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=163', 0, 'ngg_pictures', '', 0),
(164, 1, '2017-12-03 23:07:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:07:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=164', 0, 'ngg_gallery', '', 0),
(165, 1, '2017-12-03 23:07:50', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:07:50', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=165', 0, 'ngg_pictures', '', 0),
(166, 1, '2017-12-03 23:09:18', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:09:18', '2017-12-03 23:09:18', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=166', 0, 'ngg_pictures', '', 0);
INSERT INTO `clm_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(167, 1, '2017-12-03 23:07:54', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:07:54', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=167', 0, 'ngg_pictures', '', 0),
(168, 1, '2017-12-03 23:09:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2017-12-03 23:09:17', '2017-12-03 23:09:17', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://wordpress/?p=168', 0, 'ngg_pictures', '', 0),
(169, 1, '2017-12-04 07:50:32', '2017-12-04 07:50:32', '[Best_Wordpress_Gallery id="2" gal_title="vpn"]', 'vpn', '', 'publish', 'closed', 'closed', '', 'vpn', '', '', '2017-12-04 07:50:32', '2017-12-04 07:50:32', '', 0, 'http://wordpress/bwg_gallery/vpn/', 0, 'bwg_gallery', '', 0),
(170, 1, '2017-12-04 21:31:57', '2017-12-04 21:31:57', '', 'Homunculus loxodontus', '', 'inherit', 'closed', 'closed', '', '98-autosave-v1', '', '', '2017-12-04 21:31:57', '2017-12-04 21:31:57', '', 98, 'http://wordpress/98-autosave-v1/', 0, 'revision', '', 0),
(171, 1, '2017-12-04 21:32:12', '2017-12-04 21:32:12', '', 'donald trump', '', 'inherit', 'closed', 'closed', '', '94-autosave-v1', '', '', '2017-12-04 21:32:12', '2017-12-04 21:32:12', '', 94, 'http://wordpress/94-autosave-v1/', 0, 'revision', '', 0),
(172, 1, '2017-12-07 18:40:53', '2017-12-07 18:40:53', '', 'cropped-centara-1.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-centara-1-jpg', '', '', '2017-12-07 18:40:53', '2017-12-07 18:40:53', '', 0, 'http://wordpress/wp-content/uploads/2017/12/cropped-centara-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(175, 1, '2017-12-07 18:58:57', '2017-12-07 18:58:57', 'http://wordpress/wp-content/uploads/2017/12/cropped-logo.png', 'cropped-logo.png', '', 'inherit', 'open', 'closed', '', 'cropped-logo-png', '', '', '2017-12-07 18:58:57', '2017-12-07 18:58:57', '', 0, 'http://wordpress/wp-content/uploads/2017/12/cropped-logo.png', 0, 'attachment', 'image/png', 0),
(179, 1, '2017-12-07 19:05:56', '2017-12-07 19:05:56', '', 'bisque', '', 'inherit', 'open', 'closed', '', 'bisque', '', '', '2017-12-07 19:05:56', '2017-12-07 19:05:56', '', 0, 'http://wordpress/wp-content/uploads/2017/12/bisque.jpg', 0, 'attachment', 'image/jpeg', 0),
(186, 1, '2017-12-07 19:13:24', '2017-12-07 19:13:24', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2017-12-07 19:13:24', '2017-12-07 19:13:24', '', 0, 'http://wordpress/wp-content/uploads/2017/12/logo.png', 0, 'attachment', 'image/png', 0),
(188, 1, '2017-12-08 11:23:07', '2017-12-08 11:23:07', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<!--more-->t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'about us', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2017-12-12 15:25:54', '2017-12-12 15:25:54', '', 0, 'http://wordpress/?page_id=188', 0, 'page', '', 0),
(189, 1, '2017-12-08 11:23:07', '2017-12-08 11:23:07', ' ', '', '', 'publish', 'closed', 'closed', '', '189', '', '', '2017-12-12 15:31:43', '2017-12-12 15:31:43', '', 0, 'http://wordpress/189/', 2, 'nav_menu_item', '', 0),
(190, 1, '2017-12-08 11:23:07', '2017-12-08 11:23:07', '', 'about us', '', 'inherit', 'closed', 'closed', '', '188-revision-v1', '', '', '2017-12-08 11:23:07', '2017-12-08 11:23:07', '', 188, 'http://wordpress/188-revision-v1/', 0, 'revision', '', 0),
(193, 1, '2017-12-08 11:34:31', '2017-12-08 11:34:31', '', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-12-08 11:34:31', '2017-12-08 11:34:31', '', 5, 'http://wordpress/5-revision-v1/', 0, 'revision', '', 0),
(195, 1, '2017-12-08 11:35:53', '2017-12-08 11:35:53', '', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-12-08 11:35:53', '2017-12-08 11:35:53', '', 5, 'http://wordpress/5-revision-v1/', 0, 'revision', '', 0),
(197, 1, '2017-12-08 11:58:47', '2017-12-08 11:58:47', '', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-12-08 11:58:47', '2017-12-08 11:58:47', '', 5, 'http://wordpress/5-revision-v1/', 0, 'revision', '', 0),
(198, 1, '2017-12-08 12:04:51', '2017-12-08 12:04:51', '', 'kharlan', '', 'inherit', 'open', 'closed', '', 'photo_2017-11-23_15-51-05', '', '', '2017-12-08 12:05:03', '2017-12-08 12:05:03', '', 69, 'http://wordpress/wp-content/uploads/2017/12/photo_2017-11-23_15-51-05.jpg', 0, 'attachment', 'image/jpeg', 0),
(199, 1, '2017-12-08 12:31:21', '2017-12-08 12:31:21', '', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-12-08 12:31:21', '2017-12-08 12:31:21', '', 17, 'http://wordpress/17-revision-v1/', 0, 'revision', '', 0),
(201, 1, '2017-12-10 12:15:57', '2017-12-10 12:15:57', 'This news is from a village in England. There is a mother duck. She has nine baby ducklings. Sadly, the mother duck <strong>goes missing</strong>.\r\n<blockquote>The ducklings <strong>need</strong> a parent. A dog <strong>takes them in</strong>. The dog’s name is Fred. He is ten years old. He is a labrador dog.</blockquote>\r\nFred is a father to the ducklings, the ducklings love him! They often ride on his back!', 'sample post', '', 'publish', 'open', 'open', '', 'sample-post', '', '', '2018-05-30 11:44:55', '2018-05-30 11:44:55', '', 0, 'http://wordpress/?p=201', 0, 'post', '', 1),
(202, 1, '2017-12-10 12:15:57', '2017-12-10 12:15:57', 'лолирую с такого поста)', 'кек', '', 'inherit', 'closed', 'closed', '', '201-revision-v1', '', '', '2017-12-10 12:15:57', '2017-12-10 12:15:57', '', 201, 'http://wordpress/201-revision-v1/', 0, 'revision', '', 0),
(203, 1, '2017-12-10 12:38:01', '2017-12-10 12:38:01', '', 'trolling', '', 'inherit', 'open', 'closed', '', 'trolling', '', '', '2017-12-10 12:38:01', '2017-12-10 12:38:01', '', 201, 'http://wordpress/wp-content/uploads/2017/12/trolling.jpg', 0, 'attachment', 'image/jpeg', 0),
(204, 1, '2017-12-10 13:01:06', '2017-12-10 13:01:06', '', 'hola mundo', '', 'inherit', 'open', 'closed', '', 'hola-mundo-en-c', '', '', '2017-12-10 13:01:14', '2017-12-10 13:01:14', '', 1, 'http://wordpress/wp-content/uploads/2017/12/hola-mundo-en-c.jpg', 0, 'attachment', 'image/jpeg', 0),
(205, 1, '2017-12-10 13:01:18', '2017-12-10 13:01:18', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2017-12-10 13:01:18', '2017-12-10 13:01:18', '', 1, 'http://wordpress/1-revision-v1/', 0, 'revision', '', 0),
(206, 1, '2017-12-10 18:33:20', '2017-12-10 18:33:20', 'лолирую с такого поста)\r\n\r\n&nbsp;\r\n<blockquote>2112лолирую с такого поста)</blockquote>', 'кек', '', 'inherit', 'closed', 'closed', '', '201-revision-v1', '', '', '2017-12-10 18:33:20', '2017-12-10 18:33:20', '', 201, 'http://wordpress/201-revision-v1/', 0, 'revision', '', 0),
(207, 1, '2017-12-10 23:07:31', '2017-12-10 23:07:31', 'gastropub kitsch heirloom biodiesel shabby chic pickled lomo sustainable small batch bespoke fap normcore pug deep v asymmetrical occupy tofu artisan chambray YOLO art party post-ironic tousled blog roof party paleo mlkshk hashtag fanny pack Carles VHS single-origin coffee swag pop-up skateboard viral raw denim brunch mumblecore jean shorts fingerstache crucifix Vice slow-carb selfies PBR&amp;B before they sold out flannel meggings farm-to-table seitan iPhone ennui actually wolf polaroid umami Helvetica try-hard XOXO drinking vinegar Banksy Bushwick Blue Bottle leggings vinyl pour-over messenger bag Marfa cardigan butcher<!--more--> Neutra scenester typewriter sartorial Brooklyn plaid bicycle rights pork belly tattooed beard 3 wolf moon mustache you probably haven\'t heard of them\r\n<blockquote>Tumblr literally synth gluten-free</blockquote>\r\nfour loko Austin meh cray stumptown street art tote bag Williamsburg craft beer banh mi salvia High Life chillwave kogi Pinterest keytar fashion axe whatever McSweeney\'s dreamcatcher American Apparel Echo Park gentrify Tonx Pitchfork semiotics Shoreditch cliche Cosby sweater PBR narwhal cornhole quinoa wayfarers hella authentic freegan master cleanse irony letterpress twee aesthetic +1 hoodie cred chia Thundercats banjo flexitarian food truck Portland fixie forage Truffaut bitters next level vegan locavore Godard 8-bit ethical ugh photo booth Intelligentsia Kickstarter trust fund kale chips Schlitz sriracha lo-fi Odd Future direct trade put a bird on it yr organic church-key selvage keffiyeh disrupt 90\'s Wes Anderson Etsy distillery readymade squid mixtape DIY retro', 'lorem', '', 'publish', 'open', 'open', '', 'lorem', '', '', '2017-12-10 23:07:31', '2017-12-10 23:07:31', '', 0, 'http://wordpress/?p=207', 0, 'post', '', 0),
(208, 1, '2017-12-10 23:07:31', '2017-12-10 23:07:31', 'gastropub kitsch heirloom biodiesel shabby chic pickled lomo sustainable small batch bespoke fap normcore pug deep v asymmetrical occupy tofu artisan chambray YOLO art party post-ironic tousled blog roof party paleo mlkshk hashtag fanny pack Carles VHS single-origin coffee swag pop-up skateboard viral raw denim brunch mumblecore jean shorts fingerstache crucifix Vice slow-carb selfies PBR&amp;B before they sold out flannel meggings farm-to-table seitan iPhone ennui actually wolf polaroid umami Helvetica try-hard XOXO drinking vinegar Banksy Bushwick Blue Bottle leggings vinyl pour-over messenger bag Marfa cardigan butcher<!--more--> Neutra scenester typewriter sartorial Brooklyn plaid bicycle rights pork belly tattooed beard 3 wolf moon mustache you probably haven\'t heard of them\r\n<blockquote>Tumblr literally synth gluten-free</blockquote>\r\nfour loko Austin meh cray stumptown street art tote bag Williamsburg craft beer banh mi salvia High Life chillwave kogi Pinterest keytar fashion axe whatever McSweeney\'s dreamcatcher American Apparel Echo Park gentrify Tonx Pitchfork semiotics Shoreditch cliche Cosby sweater PBR narwhal cornhole quinoa wayfarers hella authentic freegan master cleanse irony letterpress twee aesthetic +1 hoodie cred chia Thundercats banjo flexitarian food truck Portland fixie forage Truffaut bitters next level vegan locavore Godard 8-bit ethical ugh photo booth Intelligentsia Kickstarter trust fund kale chips Schlitz sriracha lo-fi Odd Future direct trade put a bird on it yr organic church-key selvage keffiyeh disrupt 90\'s Wes Anderson Etsy distillery readymade squid mixtape DIY retro', 'lorem', '', 'inherit', 'closed', 'closed', '', '207-revision-v1', '', '', '2017-12-10 23:07:31', '2017-12-10 23:07:31', '', 207, 'http://wordpress/207-revision-v1/', 0, 'revision', '', 0),
(209, 1, '2017-12-11 13:19:04', '2017-12-11 13:19:04', 'hello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello<!--more--> posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello post', 'hello post', '', 'publish', 'open', 'open', '', 'hello-post', '', '', '2017-12-11 13:19:11', '2017-12-11 13:19:11', '', 0, 'http://wordpress/?p=209', 0, 'post', '', 0),
(210, 1, '2017-12-11 13:19:04', '2017-12-11 13:19:04', 'hello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello<!--more--> posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello posthello post', 'hello post', '', 'inherit', 'closed', 'closed', '', '209-revision-v1', '', '', '2017-12-11 13:19:04', '2017-12-11 13:19:04', '', 209, 'http://wordpress/209-revision-v1/', 0, 'revision', '', 0),
(211, 1, '2017-12-12 15:04:15', '2017-12-12 15:04:15', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:1:"5";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Page Home', 'page-home', 'publish', 'closed', 'closed', '', 'group_5a2fef1731b25', '', '', '2018-05-30 11:40:29', '2018-05-30 11:40:29', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=211', 0, 'acf-field-group', '', 0),
(212, 1, '2017-12-12 15:04:15', '2017-12-12 15:04:15', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Works Section Header', 'works_section_header', 'publish', 'closed', 'closed', '', 'field_5a2fef1da38f0', '', '', '2017-12-12 15:04:15', '2017-12-12 15:04:15', '', 211, 'http://wordpress/?post_type=acf-field&p=212', 0, 'acf-field', '', 0),
(213, 1, '2017-12-12 15:04:15', '2017-12-12 15:04:15', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Services Section Header', 'services_section_header', 'publish', 'closed', 'closed', '', 'field_5a2fef33a38f1', '', '', '2017-12-12 15:04:15', '2017-12-12 15:04:15', '', 211, 'http://wordpress/?post_type=acf-field&p=213', 1, 'acf-field', '', 0),
(215, 1, '2017-12-12 15:04:15', '2017-12-12 15:04:15', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Reviews Section Header', 'reviews_section_header', 'publish', 'closed', 'closed', '', 'field_5a2fefc2a38f3', '', '', '2017-12-12 15:07:00', '2017-12-12 15:07:00', '', 211, 'http://wordpress/?post_type=acf-field&#038;p=215', 2, 'acf-field', '', 0),
(216, 1, '2017-12-12 15:04:15', '2017-12-12 15:04:15', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Contacts Section Header', 'home-contacts_section_header', 'publish', 'closed', 'closed', '', 'field_5a2fefdfa38f4', '', '', '2018-05-30 11:40:29', '2018-05-30 11:40:29', '', 211, 'http://wordpress/?post_type=acf-field&#038;p=216', 3, 'acf-field', '', 0),
(217, 1, '2017-12-12 15:05:51', '2017-12-12 15:05:51', '', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-12-12 15:05:51', '2017-12-12 15:05:51', '', 5, 'http://wordpress/5-revision-v1/', 0, 'revision', '', 0),
(218, 1, '2017-12-12 15:06:55', '2017-12-12 15:06:55', '', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-12-12 15:06:55', '2017-12-12 15:06:55', '', 5, 'http://wordpress/5-revision-v1/', 0, 'revision', '', 0),
(219, 1, '2017-12-12 15:07:13', '2017-12-12 15:07:13', '', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-12-12 15:07:13', '2017-12-12 15:07:13', '', 5, 'http://wordpress/5-revision-v1/', 0, 'revision', '', 0),
(220, 1, '2017-12-12 15:08:18', '2017-12-12 15:08:18', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:2:"17";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Page Contact', 'page-contact', 'publish', 'closed', 'closed', '', 'group_5a2ff0b5d55c4', '', '', '2017-12-12 15:08:36', '2017-12-12 15:08:36', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=220', 0, 'acf-field-group', '', 0),
(221, 1, '2017-12-12 15:08:18', '2017-12-12 15:08:18', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Contacts Section Header', 'contacts_section_header', 'publish', 'closed', 'closed', '', 'field_5a2ff0c98b34c', '', '', '2017-12-12 15:08:18', '2017-12-12 15:08:18', '', 220, 'http://wordpress/?post_type=acf-field&p=221', 0, 'acf-field', '', 0),
(222, 1, '2017-12-12 15:08:54', '2017-12-12 15:08:54', '', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-12-12 15:08:54', '2017-12-12 15:08:54', '', 17, 'http://wordpress/17-revision-v1/', 0, 'revision', '', 0),
(223, 1, '2017-12-12 15:10:09', '2017-12-12 15:10:09', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:2:"19";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Page Services', 'page-services', 'publish', 'closed', 'closed', '', 'group_5a2ff1316a58f', '', '', '2017-12-12 15:10:27', '2017-12-12 15:10:27', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=223', 0, 'acf-field-group', '', 0),
(224, 1, '2017-12-12 15:10:09', '2017-12-12 15:10:09', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Services Section Header', 'services_section_header', 'publish', 'closed', 'closed', '', 'field_5a2ff13785a08', '', '', '2017-12-12 15:10:09', '2017-12-12 15:10:09', '', 223, 'http://wordpress/?post_type=acf-field&p=224', 0, 'acf-field', '', 0),
(225, 1, '2017-12-12 15:10:41', '2017-12-12 15:10:41', '', 'services', '', 'inherit', 'closed', 'closed', '', '19-revision-v1', '', '', '2017-12-12 15:10:41', '2017-12-12 15:10:41', '', 19, 'http://wordpress/19-revision-v1/', 0, 'revision', '', 0),
(226, 1, '2017-12-12 15:13:30', '2017-12-12 15:13:30', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:3:"120";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Page Works', 'page-works', 'publish', 'closed', 'closed', '', 'group_5a2ff1c1ad5f8', '', '', '2017-12-12 15:13:30', '2017-12-12 15:13:30', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=226', 0, 'acf-field-group', '', 0),
(227, 1, '2017-12-12 15:13:30', '2017-12-12 15:13:30', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Works Section Header', 'works_section_header', 'publish', 'closed', 'closed', '', 'field_5a2ff1c9377cc', '', '', '2017-12-12 15:13:30', '2017-12-12 15:13:30', '', 226, 'http://wordpress/?post_type=acf-field&p=227', 0, 'acf-field', '', 0),
(228, 1, '2017-12-12 15:13:49', '2017-12-12 15:13:49', '', 'works', '', 'inherit', 'closed', 'closed', '', '120-revision-v1', '', '', '2017-12-12 15:13:49', '2017-12-12 15:13:49', '', 120, 'http://wordpress/120-revision-v1/', 0, 'revision', '', 0),
(229, 1, '2017-12-12 15:16:39', '2017-12-12 15:16:39', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:3:"188";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Page About Us', 'page-about-us', 'publish', 'closed', 'closed', '', 'group_5a2ff2a0a7ccb', '', '', '2017-12-12 15:26:07', '2017-12-12 15:26:07', '', 0, 'http://wordpress/?post_type=acf-field-group&#038;p=229', 0, 'acf-field-group', '', 0),
(230, 1, '2017-12-12 15:16:39', '2017-12-12 15:16:39', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Header', 'about_us_section_header', 'publish', 'closed', 'closed', '', 'field_5a2ff2a7354e5', '', '', '2017-12-12 15:16:39', '2017-12-12 15:16:39', '', 229, 'http://wordpress/?post_type=acf-field&p=230', 0, 'acf-field', '', 0),
(231, 1, '2017-12-12 15:16:39', '2017-12-12 15:16:39', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Subtitle', 'about_us_subtitle', 'publish', 'closed', 'closed', '', 'field_5a2ff2b4354e6', '', '', '2017-12-12 15:19:20', '2017-12-12 15:19:20', '', 229, 'http://wordpress/?post_type=acf-field&#038;p=231', 1, 'acf-field', '', 0),
(232, 1, '2017-12-12 15:17:34', '2017-12-12 15:17:34', '', 'about us', '', 'inherit', 'closed', 'closed', '', '188-revision-v1', '', '', '2017-12-12 15:17:34', '2017-12-12 15:17:34', '', 188, 'http://wordpress/188-revision-v1/', 0, 'revision', '', 0),
(234, 1, '2017-12-12 15:19:34', '2017-12-12 15:19:34', '', 'about us', '', 'inherit', 'closed', 'closed', '', '188-revision-v1', '', '', '2017-12-12 15:19:34', '2017-12-12 15:19:34', '', 188, 'http://wordpress/188-revision-v1/', 0, 'revision', '', 0),
(235, 1, '2017-12-12 15:20:14', '2017-12-12 15:20:14', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<!--more-->t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'about us', '', 'inherit', 'closed', 'closed', '', '188-revision-v1', '', '', '2017-12-12 15:20:14', '2017-12-12 15:20:14', '', 188, 'http://wordpress/188-revision-v1/', 0, 'revision', '', 0),
(236, 1, '2017-12-12 15:24:08', '2017-12-12 15:24:08', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Reviews Section Header', 'reviews_section_header', 'publish', 'closed', 'closed', '', 'field_5a2ff488ccddb', '', '', '2017-12-12 15:26:07', '2017-12-12 15:26:07', '', 229, 'http://wordpress/?post_type=acf-field&#038;p=236', 3, 'acf-field', '', 0),
(237, 1, '2017-12-12 15:24:39', '2017-12-12 15:24:39', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Contact Section Header', 'contacts_section_header', 'publish', 'closed', 'closed', '', 'field_5a2ff4a3427b5', '', '', '2017-12-12 15:26:07', '2017-12-12 15:26:07', '', 229, 'http://wordpress/?post_type=acf-field&#038;p=237', 4, 'acf-field', '', 0),
(238, 1, '2017-12-12 15:25:20', '2017-12-12 15:25:20', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Team Section Header', 'team_section_header', 'publish', 'closed', 'closed', '', 'field_5a2ff4d18a75e', '', '', '2017-12-12 15:26:07', '2017-12-12 15:26:07', '', 229, 'http://wordpress/?post_type=acf-field&#038;p=238', 2, 'acf-field', '', 0),
(239, 1, '2017-12-12 15:25:54', '2017-12-12 15:25:54', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<!--more-->t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'about us', '', 'inherit', 'closed', 'closed', '', '188-revision-v1', '', '', '2017-12-12 15:25:54', '2017-12-12 15:25:54', '', 188, 'http://wordpress/188-revision-v1/', 0, 'revision', '', 0),
(244, 1, '2018-05-30 10:34:27', '2018-05-30 10:34:27', '<label> Your Name\r\n    [text* your-name class:w-100 class:contact] </label>\r\n\r\n<label> Your Email\r\n    [email* your-email class:w-100 class:contact] </label>\r\n\r\n[submit class:btn class:btn-default class:btn-white "Send" ]\n1\nclemo "[your-subject]"\n[your-name] <wordpress@139.59.164.52>\nkrforgames@gmail.com\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\nEmpty\r\n\r\n-- \r\nThis e-mail was sent from a contact form on clemo (http://139.59.164.52/wordpress)\nReply-To: [your-email]\n\n\n\n1\nclemo "[your-subject]"\nclemo <wordpress@139.59.164.52>\n[your-email]\nHi! You just posted a message for yourself!\r\n\r\n-- \r\nThis e-mail was sent from a contact form on clemo (http://139.59.164.52/wordpress)\nReply-To: krforgames@gmail.com\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nYour entered code is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2018-05-30 11:36:33', '2018-05-30 11:36:33', '', 0, 'http://139.59.164.52/wordpress/?post_type=wpcf7_contact_form&#038;p=244', 0, 'wpcf7_contact_form', '', 0),
(245, 1, '2018-05-30 10:36:11', '2018-05-30 10:36:11', '<em>[contact-form-7 id="244" title="Contact form 1"]</em>', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-05-30 10:36:11', '2018-05-30 10:36:11', '', 17, 'http://139.59.164.52/wordpress/17-revision-v1/', 0, 'revision', '', 0),
(246, 1, '2018-05-30 10:50:25', '2018-05-30 10:50:25', '[contact-form-7 id="244" title="Contact Us" html_class="w-100"]', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-05-30 10:50:25', '2018-05-30 10:50:25', '', 17, 'http://139.59.164.52/wordpress/17-revision-v1/', 0, 'revision', '', 0),
(247, 1, '2018-05-30 10:54:12', '2018-05-30 10:54:12', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100"]', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-05-30 10:54:12', '2018-05-30 10:54:12', '', 17, 'http://139.59.164.52/wordpress/17-revision-v1/', 0, 'revision', '', 0),
(248, 1, '2018-05-30 10:54:40', '2018-05-30 10:54:40', '[contact-form-7 id="244" title="Contact form 1" html_class="wv-100"]', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-05-30 10:54:40', '2018-05-30 10:54:40', '', 17, 'http://139.59.164.52/wordpress/17-revision-v1/', 0, 'revision', '', 0),
(249, 1, '2018-05-30 11:05:28', '2018-05-30 11:05:28', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100"]', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-autosave-v1', '', '', '2018-05-30 11:05:28', '2018-05-30 11:05:28', '', 17, 'http://139.59.164.52/wordpress/17-autosave-v1/', 0, 'revision', '', 0),
(250, 1, '2018-05-30 10:55:44', '2018-05-30 10:55:44', '[contact-form-7 id="244" title="Contact form 1" html_id="contact-form-1234" html_class="form contact-form"]', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-05-30 10:55:44', '2018-05-30 10:55:44', '', 17, 'http://139.59.164.52/wordpress/17-revision-v1/', 0, 'revision', '', 0),
(251, 1, '2018-05-30 10:56:39', '2018-05-30 10:56:39', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100"]', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-05-30 10:56:39', '2018-05-30 10:56:39', '', 17, 'http://139.59.164.52/wordpress/17-revision-v1/', 0, 'revision', '', 0),
(252, 1, '2018-05-30 11:04:26', '2018-05-30 11:04:26', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100 m-auto"]', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-05-30 11:04:26', '2018-05-30 11:04:26', '', 17, 'http://139.59.164.52/wordpress/17-revision-v1/', 0, 'revision', '', 0),
(253, 1, '2018-05-30 11:28:01', '2018-05-30 11:28:01', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100"]', 'contacts', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-05-30 11:28:01', '2018-05-30 11:28:01', '', 17, 'http://139.59.164.52/wordpress/17-revision-v1/', 0, 'revision', '', 0),
(254, 1, '2018-05-30 11:28:20', '2018-05-30 11:28:20', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100"]', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-05-30 11:28:20', '2018-05-30 11:28:20', '', 5, 'http://139.59.164.52/wordpress/5-revision-v1/', 0, 'revision', '', 0),
(255, 1, '2018-05-30 11:40:41', '2018-05-30 11:40:41', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100"]', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-05-30 11:40:41', '2018-05-30 11:40:41', '', 5, 'http://139.59.164.52/wordpress/5-revision-v1/', 0, 'revision', '', 0),
(256, 1, '2018-05-30 11:40:55', '2018-05-30 11:40:55', '[contact-form-7 id="244" title="Contact form 1" html_class="w-100"]', 'home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-05-30 11:40:55', '2018-05-30 11:40:55', '', 5, 'http://139.59.164.52/wordpress/5-revision-v1/', 0, 'revision', '', 0),
(257, 1, '2018-05-30 11:43:28', '2018-05-30 11:43:28', 'лолирую с такого поста)\n\n&nbsp;\n<blockquote>2112лолирую с такого поста)</blockquote>', 'sample post', '', 'inherit', 'closed', 'closed', '', '201-autosave-v1', '', '', '2018-05-30 11:43:28', '2018-05-30 11:43:28', '', 201, 'http://139.59.164.52/wordpress/201-autosave-v1/', 0, 'revision', '', 0),
(258, 1, '2018-05-30 11:43:53', '2018-05-30 11:43:53', 'This news is from a village in England. There is a mother duck. She has nine baby ducklings. Sadly, the mother duck <strong>goes missing</strong>.\r\n<blockquote>The ducklings <strong>need</strong> a parent. A dog <strong>takes them in</strong>. The dog’s name is Fred. He is ten years old. He is a labrador dog.</blockquote>\r\nFred is a father to the ducklings, the ducklings love him! They often ride on his back!', 'sample post', '', 'inherit', 'closed', 'closed', '', '201-revision-v1', '', '', '2018-05-30 11:43:53', '2018-05-30 11:43:53', '', 201, 'http://139.59.164.52/wordpress/201-revision-v1/', 0, 'revision', '', 0),
(259, 1, '2018-05-30 11:44:52', '2018-05-30 11:44:52', '', 'Dog-Fathers-Ducklings-200x100', '', 'inherit', 'open', 'closed', '', 'dog-fathers-ducklings-200x100', '', '', '2018-05-30 11:44:52', '2018-05-30 11:44:52', '', 201, 'http://139.59.164.52/wordpress/wp-content/uploads/2017/12/Dog-Fathers-Ducklings-200x100.jpg', 0, 'attachment', 'image/jpeg', 0),
(260, 1, '2018-05-30 11:48:22', '2018-05-30 11:48:22', 'Nearby Mount Vesuvius erupted in 79 AD, killing many Pompeii residents and famously freezing them in place.This skeleton appears to be from a man who survived the initial explosion and was fleeing the doomed city.A leg injury, however, may have slowed him down before he was crushed by the huge stone hurtling through the air.\n\nPompeii archaeologists say the skeleton shows signs of a bone infection in his leg, which could have made walking - much less running - very difficult.', 'mmmmm kaef', '', 'inherit', 'closed', 'closed', '', '141-autosave-v1', '', '', '2018-05-30 11:48:22', '2018-05-30 11:48:22', '', 141, 'http://139.59.164.52/wordpress/141-autosave-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `clm_termmeta`
--

CREATE TABLE `clm_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `clm_terms`
--

CREATE TABLE `clm_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clm_terms`
--

INSERT INTO `clm_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(4, 'Main Menu', 'main-menu', 0),
(5, 'lolkek', 'lolkek', 0),
(6, 'hello', 'hello', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `clm_term_relationships`
--

CREATE TABLE `clm_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clm_term_relationships`
--

INSERT INTO `clm_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 6, 0),
(116, 4, 0),
(117, 4, 0),
(118, 4, 0),
(119, 4, 0),
(121, 4, 0),
(189, 4, 0),
(201, 1, 0),
(201, 5, 0),
(207, 1, 0),
(209, 6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `clm_term_taxonomy`
--

CREATE TABLE `clm_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clm_term_taxonomy`
--

INSERT INTO `clm_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 3),
(4, 4, 'nav_menu', '', 0, 6),
(5, 5, 'category', '', 0, 1),
(6, 6, 'category', '', 0, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `clm_usermeta`
--

CREATE TABLE `clm_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clm_usermeta`
--

INSERT INTO `clm_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'clemo_admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'clm_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'clm_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:7:{s:64:"cecaa3ffdcb583204b717f11e5f19b829d62f1151ed513723ec4ee3d3356e8f1";a:4:{s:10:"expiration";i:1530758955;s:2:"ip";s:13:"59.24.176.126";s:2:"ua";s:73:"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0";s:5:"login";i:1529549355;}s:64:"9cc64ea326bc44f204277c9a10332deda75118cac27a54c21bfd15b2fa5afb80";a:4:{s:10:"expiration";i:1530820905;s:2:"ip";s:13:"194.6.231.251";s:2:"ua";s:73:"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0";s:5:"login";i:1529611305;}s:64:"07889376f40556c75bf4d06b6c782d998c007f6f245025b9db393be6495f9a5d";a:4:{s:10:"expiration";i:1530848174;s:2:"ip";s:14:"202.137.154.43";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0";s:5:"login";i:1529638574;}s:64:"63b38cd89797a8a79ecad43fa53ad665ebd79613cdd72a8464f57c77457dbe2d";a:4:{s:10:"expiration";i:1530871282;s:2:"ip";s:13:"194.6.231.251";s:2:"ua";s:73:"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0";s:5:"login";i:1529661682;}s:64:"2876c3066beea5210bd51a5a23d49fa48eff09aa939dddf0ee90b69c866131de";a:4:{s:10:"expiration";i:1530922120;s:2:"ip";s:13:"115.84.91.102";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0";s:5:"login";i:1529712520;}s:64:"d87334541d8c220c6d598986f5acfa512a9a158dcc0fa8c7be8ba3754a8b9931";a:4:{s:10:"expiration";i:1530194924;s:2:"ip";s:12:"176.36.53.31";s:2:"ua";s:135:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/66.0.3359.181 Chrome/66.0.3359.181 Safari/537.36";s:5:"login";i:1530022124;}s:64:"b2bb816ebb6bed5ae0eb0169b00dfcaf6aac72b5996de37253c821cd40557253";a:4:{s:10:"expiration";i:1531286931;s:2:"ip";s:12:"176.36.53.31";s:2:"ua";s:135:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/66.0.3359.181 Chrome/66.0.3359.181 Safari/537.36";s:5:"login";i:1530077331;}}'),
(17, 1, 'clm_dashboard_quick_press_last_post_id', '261'),
(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:11:"176.36.53.0";}'),
(19, 1, 'clm_user-settings', 'libraryContent=browse&mfold=o&editor=tinymce&posts_list_mode=list&editor_expand=on'),
(20, 1, 'clm_user-settings-time', '1512947248'),
(21, 1, 'acf_user_settings', 'a:0:{}'),
(22, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(23, 1, 'metaboxhidden_nav-menus', 'a:7:{i:0;s:27:"add-post-type-carousel_team";i:1;s:21:"add-post-type-reviews";i:2;s:20:"add-post-type-skills";i:3;s:21:"add-post-type-service";i:4;s:21:"add-post-type-contact";i:5;s:21:"add-post-type-gallery";i:6;s:12:"add-post_tag";}'),
(24, 1, 'nav_menu_recently_edited', '4'),
(25, 1, 'meta-box-order_work', 'a:4:{s:15:"acf_after_title";s:0:"";s:4:"side";s:22:"submitdiv,postimagediv";s:6:"normal";s:151:"acf-group_5a228a38c3b69,acf-group_5a22bf2462ead,acf-group_5a22a53a176de,acf-group_5a22a1e75f7e5,acf-group_5a229eb845240,acf-group_5a22b67ee9ca1,slugdiv";s:8:"advanced";s:0:"";}'),
(26, 1, 'screen_layout_work', '2'),
(27, 1, 'edit_work_per_page', '20'),
(28, 1, 'closedpostboxes_page', 'a:0:{}'),
(29, 1, 'metaboxhidden_page', 'a:12:{i:0;s:23:"acf-group_5a228a38c3b69";i:1;s:23:"acf-group_5a22bf2462ead";i:2;s:23:"acf-group_5a2a7846e1763";i:3;s:23:"acf-group_5a22a53a176de";i:4;s:23:"acf-group_5a22a1e75f7e5";i:5;s:23:"acf-group_5a229eb845240";i:6;s:23:"acf-group_5a22b67ee9ca1";i:7;s:10:"postcustom";i:8;s:16:"commentstatusdiv";i:9;s:11:"commentsdiv";i:10;s:7:"slugdiv";i:11;s:9:"authordiv";}'),
(30, 1, 'closedpostboxes_work', 'a:0:{}'),
(31, 1, 'metaboxhidden_work', 'a:11:{i:0;s:23:"acf-group_5a2ff2a0a7ccb";i:1;s:23:"acf-group_5a2ff0b5d55c4";i:2;s:23:"acf-group_5a2fef1731b25";i:3;s:23:"acf-group_5a2ff1316a58f";i:4;s:23:"acf-group_5a2ff1c1ad5f8";i:5;s:23:"acf-group_5a228a38c3b69";i:6;s:23:"acf-group_5a22bf2462ead";i:7;s:23:"acf-group_5a22a53a176de";i:8;s:23:"acf-group_5a22a1e75f7e5";i:9;s:23:"acf-group_5a229eb845240";i:10;s:7:"slugdiv";}');

-- --------------------------------------------------------

--
-- Структура таблицы `clm_users`
--

CREATE TABLE `clm_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clm_users`
--

INSERT INTO `clm_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'clemo_admin', '$P$BIncc2k8vSYnKsqdBz4kv5kZFohxfl0', 'clemo_admin', 'krforgames@gmail.com', '', '2017-12-02 10:45:32', '1527672761:$P$BboyhrQuluQ3PNJIX1QvWgrYscVXPe/', 0, 'clemo_admin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clm_bwg_album`
--
ALTER TABLE `clm_bwg_album`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clm_bwg_album_gallery`
--
ALTER TABLE `clm_bwg_album_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clm_bwg_gallery`
--
ALTER TABLE `clm_bwg_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clm_bwg_image`
--
ALTER TABLE `clm_bwg_image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clm_bwg_image_comment`
--
ALTER TABLE `clm_bwg_image_comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clm_bwg_image_rate`
--
ALTER TABLE `clm_bwg_image_rate`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clm_bwg_image_tag`
--
ALTER TABLE `clm_bwg_image_tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clm_bwg_shortcode`
--
ALTER TABLE `clm_bwg_shortcode`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clm_bwg_theme`
--
ALTER TABLE `clm_bwg_theme`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clm_commentmeta`
--
ALTER TABLE `clm_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `clm_comments`
--
ALTER TABLE `clm_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Индексы таблицы `clm_links`
--
ALTER TABLE `clm_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Индексы таблицы `clm_ngg_album`
--
ALTER TABLE `clm_ngg_album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Индексы таблицы `clm_ngg_gallery`
--
ALTER TABLE `clm_ngg_gallery`
  ADD PRIMARY KEY (`gid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Индексы таблицы `clm_ngg_pictures`
--
ALTER TABLE `clm_ngg_pictures`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Индексы таблицы `clm_options`
--
ALTER TABLE `clm_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Индексы таблицы `clm_postmeta`
--
ALTER TABLE `clm_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `clm_posts`
--
ALTER TABLE `clm_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Индексы таблицы `clm_termmeta`
--
ALTER TABLE `clm_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `clm_terms`
--
ALTER TABLE `clm_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Индексы таблицы `clm_term_relationships`
--
ALTER TABLE `clm_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Индексы таблицы `clm_term_taxonomy`
--
ALTER TABLE `clm_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Индексы таблицы `clm_usermeta`
--
ALTER TABLE `clm_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `clm_users`
--
ALTER TABLE `clm_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clm_bwg_album`
--
ALTER TABLE `clm_bwg_album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_bwg_album_gallery`
--
ALTER TABLE `clm_bwg_album_gallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_bwg_gallery`
--
ALTER TABLE `clm_bwg_gallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `clm_bwg_image`
--
ALTER TABLE `clm_bwg_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `clm_bwg_image_comment`
--
ALTER TABLE `clm_bwg_image_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_bwg_image_rate`
--
ALTER TABLE `clm_bwg_image_rate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_bwg_image_tag`
--
ALTER TABLE `clm_bwg_image_tag`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_bwg_theme`
--
ALTER TABLE `clm_bwg_theme`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `clm_commentmeta`
--
ALTER TABLE `clm_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_comments`
--
ALTER TABLE `clm_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `clm_links`
--
ALTER TABLE `clm_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_ngg_album`
--
ALTER TABLE `clm_ngg_album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_ngg_gallery`
--
ALTER TABLE `clm_ngg_gallery`
  MODIFY `gid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_ngg_pictures`
--
ALTER TABLE `clm_ngg_pictures`
  MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_options`
--
ALTER TABLE `clm_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=740;
--
-- AUTO_INCREMENT для таблицы `clm_postmeta`
--
ALTER TABLE `clm_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1045;
--
-- AUTO_INCREMENT для таблицы `clm_posts`
--
ALTER TABLE `clm_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;
--
-- AUTO_INCREMENT для таблицы `clm_termmeta`
--
ALTER TABLE `clm_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `clm_terms`
--
ALTER TABLE `clm_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `clm_term_taxonomy`
--
ALTER TABLE `clm_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `clm_usermeta`
--
ALTER TABLE `clm_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT для таблицы `clm_users`
--
ALTER TABLE `clm_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
