<h2 class="h2 category-block text-uppercase">
    {l s='Categories' d='Shop.Theme.Catalog'}
</h2>
<div class="category-block">
    {foreach from=$categories item=subcategory name=homeCategories}				   
        <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}"
                            title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
            <div class="category-preview">
                <div class="category-preview-image">
                    
                        {if $subcategory.id_image}
                            <img class="img63"
                                    src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'medium_default')|escape:'html':'UTF-8'}"
                                    alt=""/>
                        {else}
                            <img class="replace-2x" src="{$img_cat_dir|escape:'htmlall':'UTF-8'}{$lang_iso|escape:'htmlall':'UTF-8'}-default-medium_default.jpg"
                                    alt=""/>
                        {/if}
                    
                </div>
                <div class="category-preview-name">
                    <span>{$subcategory.name|truncate:30:'...'|escape:'html':'UTF-8'}</span>
                    <div class="category-preview-subcategories"></div>
                </div>  
            </div>
        </a>
{/foreach}
</div>