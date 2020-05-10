<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

class Categoryblock extends Module
{
    public function __construct()
    {
        $this->name = 'categoryblock';
        $this->author = 'Vensuper team';
        $this->tab = 'front_office_features';
        $this->version = '0.0.1';
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->trans('Category Block', [], 'Modules.Categoryblock.Admin');
        $this->description = $this->trans(
            'Adds a block listing all categories',
            [],
            'Modules.Categoryblock.Admin'
        );
        $this->ps_versions_compliancy = array('min' => '1.7.2.0', 'max' => _PS_VERSION_);
    }

    /**
     * @return bool
     */
    public function install()
    {
        return parent::install() && $this->registerHook('displayHome');
    }

    /**
     * @return bool
     */
    public function uninstall()
    {
        return parent::uninstall();
    }


    public function hookDisplayHome($params)
    {
        $root_cat = Category::getRootCategory($this->context->cookie->id_lang);
        $this->context->smarty->assign(
            array(
                'categories' => $root_cat->getSubCategories($this->context->cookie->id_lang)
            )
        );

        return $this->display(__FILE__, '/views/templates/hooks/homecategories.tpl');
    }

}
