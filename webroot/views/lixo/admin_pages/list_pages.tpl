<div id="sorteable_flash"></div>
<br/><br/>
<span class="h1">List pages</span>
(<a href="<S $helper->url('admin/new_page/') S>" class="a">Create page</a>)
<br/><br/>

<ol id="order_pages">
<S foreach from=$pages item=page S>
	<li class="twitter" id="page_<S $page.serial S>">
		<span >
			<a href="<S $helper->url('admin/remove_page/') S><S $page.serial S>" onclick="if(!confirm('You are sure? Remove this page in all languages?')) return false;"><S $helper->img('bin.png') S></a>
			<a href="<S $helper->url('admin/edit_page/') S><S $page.serial S>"><S $helper->img('pencil.png') S></a>
		</span>
		<span class="h1">
			<S $page.title S>
		</span> (Menu: <S $page.menu S>)<br/>
		<span>
			<S $page.intro S>
		</span>
		
		<br/><span>Created at: <S $page.created_at S></span>
		<div class="clear"></div>
	</li>
<S/foreach S>
</ol>
<script>
//<![CDATA[
Sortable.create("order_pages", {
	onUpdate:function(){
		new Ajax.Updater('sorteable_flash', '<S $helper->url("admin/sort_pages") S>',{
					asynchronous:true, 
					parameters:Sortable.serialize('order_pages')
			});
	}
});
//]]>
</script>
<S $helper->paginator($current_page, $count, $per_page, 'admin/list_pages') S>