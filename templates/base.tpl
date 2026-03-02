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
        {block 'main'}{/block}

        <footer class="footer">
            <div class="footer__wrapper container">
                <div class="footer__aside">
                    <a class="footer__logo" href="/">
                        <img src="{'default_tpl_assets' | config}img/logo-white.png" alt="">
                        {$_modx->config.default_logo_desc}
                    </a>

                    {set $footer_nav}
                        {set $footer_nav_counter = 0}
                        {foreach [5,21,10,22,23,12] as $id}
                            {set $footer_nav_counter+=1}
                            {set $pagetitle = $id | resource : 'pagetitle'}
                            {set $menutitle = $id | resource : 'menutitle'}

                            {$_modx->getChunk('@FILE chunks/footer-nav/item.tpl', [
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
                            'tpl' => '@FILE chunks/footer-nav/item.tpl'
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