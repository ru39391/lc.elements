{extends 'file:templates/base.tpl'}

{block 'intro'}
    <div class="section-title js-section-title">Ключевые направления</div>
    <div class="content content_fs_xl">{$_modx->resource.tv__intro}</div>
{/block}

{block 'main'}
    {*
        ////////////////////////////
        /// Ключевые направления ///
        ////////////////////////////
    *}
    {set $promo = json_decode($_modx->resource.tv__promo, true)}
    {set $promo_data}
        {set $promo_counter = 0}
        {foreach $promo as $idx => $promo_item}
            {set $promo_counter+=1}
            {$_modx->getChunk('@FILE chunks/content/promo-item.tpl', [
                'img' => $promo_item.promo__img,
                'title' => $promo_item.promo__title,
                'content' => $promo_item.promo__content,
                'mod' => $promo_item@first ? 'is-active' : '',
                'idx' => $idx
            ])}
        {/foreach}
    {/set}

    {if $promo_counter > 0}
    {set $promo_nav}
        {foreach $promo as $idx => $promo_item}
            {$_modx->getChunk('@FILE chunks/content/promo-btn.tpl', [
                'caption' => $promo_item.promo__title,
                'mod' => $promo_item@first ? 'is-active' : '',
                'idx' => $idx
            ])}
        {/foreach}
    {/set}
    <div class="section">
        <div class="promo js-tabs">
            <div class="promo__nav">{$promo_nav}</div>
            <div class="promo__panel"><div class="promo__panel-title js-tab-caption"></div></div>
            <div class="promo__list">{$promo_data}</div>
        </div>
    </div>
    {/if}

    {*
        ////////////////////////////
        /// Поставляемые решения ///
        ////////////////////////////
    *}
    {set $hardware = json_decode($_modx->resource.tv__hardware, true)}
    {set $hardware_data}
        {set $hardware_counter = 0}
        {foreach $hardware as $hardware_item}
            {set $hardware_counter+=1}
            {$_modx->getChunk('@FILE chunks/content/hardware-item.tpl', [
                'img' => $hardware_item.hardware__img,
                'desc' => $hardware_item.hardware__desc
            ])}
        {/foreach}
    {/set}

    {if $hardware_counter > 0}
    <div class="section">
        <div class="section-title js-section-title">Поставляемые решения</div>
        <div class="swiper js-grid-slides">
            {$hardware_data}
            <div class="hardware swiper-wrapper js-grid-wrapper"></div>
            <div class="swiper-pagination swiper-pagination_type_plain js-slides-pagination"></div>
        </div>
    </div>
    {/if}

    {*
        //////////////
        /// Выгоды ///
        //////////////
    *}
    {set $features = json_decode($_modx->resource.tv__features, true)}
    {set $features_data}
        {set $features_counter = 0}
        {foreach $features as $features_item}
            {set $features_counter+=1}
            {$_modx->getChunk('@FILE chunks/content/features-item.tpl', [
                'desc' => $features_item.features__desc
            ])}
        {/foreach}
    {/set}
        
    {if $features_counter > 0}
    <div class="section">
        <div class="section-title js-section-title">Выгоды</div>
        <div class="swiper js-slides"><div class="features swiper-wrapper">{$features_data}</div></div>
    </div>
    {/if}

    {*
        ////////////////
        /// Команада ///
        ////////////////
    *}
    {set $company = json_decode($_modx->resource.tv__company, true)}
    {set $company_data}
        {set $company_counter = 0}
        {foreach $company as $company_item}
            {set $company_counter+=1}
            {$_modx->getChunk('@FILE chunks/content/company-item.tpl', [
                'title' => $company_item.company__title,
                'desc' => $company_item.company__desc
            ])}
        {/foreach}
    {/set}
        
    {if $company_counter > 0}
    <div class="section">
        <div class="section-title js-section-title">Команда</div>
        <div class="company">
            <img class="company__bg company__bg_type_xs" src="{$_modx->resource.tv__company_mob ?: $_modx->resource.tv__company_img}" alt="" />
            <img class="company__bg company__bg_type_sm" src="{$_modx->resource.tv__company_img}" alt="" />
            <div class="company__wrapper">{$company_data}</div>
        </div>
    </div>
    {/if}

    <div class="section content content_fs_xl content_offset_bottom content_type_blockquote">{$_modx->resource.tv__outro}</div>

    {*
        /////////////////
        /// Навигация ///
        /////////////////
    *}
    {set $pagenav = json_decode($_modx->resource.tv__pagenav, true)}
    {set $pagenav_data}
        {set $pagenav_counter = 0}
        {foreach $pagenav as $idx => $pagenav_item}
            {set $pagenav_counter+=1}
            {$_modx->getChunk('@FILE chunks/nav/pagenav-item.tpl', [
                'title' => $pagenav_item.pagenav__title,
                'item' => $pagenav_item.pagenav__item,
                'hidden' => $pagenav_item.pagenav__hidden,
                'idx' => $idx
            ])}
        {/foreach}
    {/set}
    {if $pagenav_counter > 0}<div class="pagenav js-page-nav">{$pagenav_data}</div>{/if}
{/block}