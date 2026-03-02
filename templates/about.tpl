{extends 'file:templates/base.tpl'}

{block 'intro'}
    <div class="content content_fs_xl">{$_modx->resource.tv__intro}</div>
{/block}

{block 'main'}
    {*
        /////////////////////////
        /// Виды деятельности ///
        /////////////////////////
    *}
    <div class="section"></div>

    {*
        ////////////////////////////
        /// Поставляемые решение ///
        ////////////////////////////
    *}
    <div class="section">
        <div class="section-title">Поставляемые решение</div>
    </div>

    {*
        //////////////
        /// Выгоды ///
        //////////////
    *}
    <div class="section">
        <div class="section-title">Выгоды</div>
    </div>

    {*
        ////////////////
        /// Команада ///
        ////////////////
    *}
    <div class="section">
        <div class="section-title">Команада</div>
    </div>

    <div class="section content content_fs_xl content_offset_bottom content_type_blockquote">{$_modx->resource.tv__outro}</div>
{/block}