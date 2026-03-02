{set $static = 'setAssets' | snippet}

<!DOCTYPE html>
<html lang="ru" itemscope itemtype="http://schema.org/WebPage">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <base href="{'site_url' | option}" />
        
        {block 'meta'}
        <title>{$_modx->resource.tv__seotitle ?: $_modx->resource.pagetitle ~' - '~ $_modx->config.site_name}</title>
        <meta name="keywords" content="{$_modx->resource.tv__kws}" itemprop="keywords" />
        <meta name="description" content="{$_modx->resource.description}" itemprop="description" />
        {/block}
        
        <link href="{'default_tpl_assets' | config}/icons/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        {$static.css}
    </head>
    <body>
        <div class="wrapper">
            <div class="top">
                <div class="top__wrapper container">
                    <button class="city-selector" type="button">
                        {include 'file:chunks/icons/placemark-icon.tpl'}
                        Санкт-Петербург
                        {include 'file:chunks/icons/arrow-down-icon.tpl'}
                    </button>
                    <div class="lang-list">
                        <button class="lang-list__btn is-active" type="button">RU</button>
                        <button class="lang-list__btn" type="button">EN</button>
                    </div>
                </div>
            </div>

            <div class="container">
                <header class="header">
                    {set $logo}<img src="{'default_tpl_assets' | config}img/logo.png" alt="" />{/set}
                    {if $_modx->resource.id === 1}<div class="header__logo">{$logo}</div>{else}<a class="header__logo" href="/">{$logo}</a>{/if}
                    <div class="header__wrapper">
                        <div class="header__desc">{$_modx->config.default_logo_desc}</div>
                        <form class="search-form js-search-form">
                            <button class="search-form__btn" type="submit">{include 'file:chunks/icons/search-icon.tpl'}</button>
                            <input class="search-form__field" type="text" placeholder="Поиск на сайте">
                        </form>
                    </div>
                    <div class="header__aside">
                        <button class="header__btn btn btn-icon" type="button">
                            {include 'file:chunks/icons/pdf-icon.tpl'}
                            Скачать каталог
                        </button>
                        <div class="header__contacts">
                            <a class="header__contacts-phone" href="tel:{$_modx->config.default_phone | formatPhoneValue}">{$_modx->config.default_phone}</a>
                            <button class="header__contacts-link" type="button">Заказать обратный звонок</button>
                        </div>
                    </div>
                </header>

                <nav class="nav">
                    <a class="nav__item nav__item_type_btn" href="{13 | url}">
                        {13 | resource : 'pagetitle'}
                        <span class="nav__item-icon">{include 'file:chunks/icons/arrow-down-icon.tpl'}</span>
                    </a>
                    {'pdoMenu' | snippet: [
                        'parents' => 0,
                        'level' => 1,
                        'limit' => 0,
                        'outerClass' => 'nav__wrapper',
                        'rowClass' => 'nav__item',
                        'tplOuter' => '@FILE chunks/nav/wrapper.tpl'
                        'tpl' => '@FILE chunks/nav/item.tpl'
                    ]}

                    <div class="nav__aside">
                        <button class="nav__btn js-search-toggler" type="button">{include 'file:chunks/icons/search-icon.tpl'}</button>
                        <button class="nav__btn js-nav-toggler" type="button">
                            <span class="nav__btn-icon nav__btn-icon_type_open">{include 'file:chunks/icons/nav-icon.tpl'}</span>
                            <span class="nav__btn-icon nav__btn-icon_type_close">{include 'file:chunks/icons/close-icon.tpl'}</span>
                        </button>
                    </div>
                </nav>


                {block 'main'}{/block}
            </div>
        </div>

        <footer class="footer">
            <div class="footer__wrapper container">
                <div class="footer__aside">
                    {set $footer_logo}
                        <img src="{'default_tpl_assets' | config}img/logo-white.png" alt="" />
                        {$_modx->config.default_logo_desc}
                    {/set}
                    {if $_modx->resource.id === 1}<div class="footer__logo">{$footer_logo}</div>{else}<a class="footer__logo" href="/">{$footer_logo}</a>{/if}

                    {set $footer_nav}
                        {set $footer_nav_counter = 0}
                        {foreach [5,21,10,22,23,12] as $id}
                            {set $footer_nav_counter+=1}
                            {set $pagetitle = $id | resource : 'pagetitle'}
                            {set $menutitle = $id | resource : 'menutitle'}

                            {$_modx->getChunk('@FILE chunks/nav/item.tpl', [
                                'classes' => 'class="footer__nav-link"',
                                'link' => $id | url,
                                'menutitle' => $menutitle ?: $pagetitle
                            ])}
                        {/foreach}
                    {/set}
                    {if $footer_nav_counter > 0}<nav class="footer__nav">{$footer_nav}</nav>{/if}

                    <nav class="footer__nav">
                        <a class="footer__nav-link" href="{13 | url}">{13 | resource : 'menutitle'}</a>
                        {'pdoMenu' | snippet: [
                            'parents' => 13,
                            'level' => 3,
                            'limit' => 0,
                            'rowClass' => 'footer__nav-link footer__nav-link_fs_sm',
                            'tplOuter' => '@INLINE {$wrapper}'
                            'tpl' => '@FILE chunks/nav/item.tpl'
                        ]}
                    </nav>
                </div>
                <div class="footer__contacts">
                    <div class="footer__contacts-wrapper">
                        <a class="footer__contacts-phone" href="tel:{$_modx->config.default_phone | formatPhoneValue}">{$_modx->config.default_phone}</a>
                        <a class="footer__link" href="#">Заказать обратный звонок</a>
                    </div>

                    <div class="footer__contacts-wrapper">
                        <a class="footer__contacts-link" href="mailto:{$_modx->config.default_email}">{$_modx->config.default_email}</a>
                        {if $_modx->config.default_open_hours != ''}<div class="footer__contacts-text">Режим работы: {$_modx->config.default_open_hours}</div>{/if}
                    </div>

                    <div class="footer__contacts-text">{$_modx->config.default_address}</div>

                    {set $contacts = json_decode(12 | resource: 'tv__contacts', true)}
                    {set $contacts__data}
                        {set $contacts__counter = 0}
                        {foreach $contacts as $contacts__item}
                            {set $contacts__counter+=1}
                            {$_modx->getChunk('@FILE chunks/footer-contacts/item.tpl', [
                                'city' => $contacts__item.contacts__city,
                                'phone' => $contacts__item.contacts__phone,
                            ])}
                        {/foreach}
                    {/set}
                    {if $contacts__counter > 0}<ul class="footer__contacts-list">{$contacts__data}</ul>{/if}
                </div>
                <div class="footer__disclaimer">{$_modx->config.default_disclaimer}</div>
            </div>
            <div class="footer__bottom">
                <div class="footer__bottom-wrapper container">
                    <div class="footer__copyright">{$_modx->config.site_name}, 2021-{'' | date : 'Y'}</div>
                    <a class="footer__link" href="{20 | url}">{20 | resource : 'pagetitle'}</a>
                </div>
            </div>
        </footer>

        {$static.js}
    </body>
</html>