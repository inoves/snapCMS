
<div class="grid_9">	
	<div class="content_main">
	  <h1><S $title_action S></h1>
		<div class="content">
			
			
			<ul id="items">
				<S foreach from=$pages item=page S>
					<li id="item_<S $page->page_id S>">
						<div class="page<S if $page->active == 0 S> disable<S /if S>">
							<h4>
								<S if $page->product == 0 S>
									<img src="/images/page_white_text.png"/>
								<S else S>
									<img src="/images/package.png"/>
								<S /if S>
								<a href="<S$helper->url('/')S>admin/pages/edit/<S $page->page_id S>">
									<S $page->title S>
								</a>
							</h4>
							<S $page->intro|truncate:110:"" S>
							<p>
								&raquo; <a href="<S$helper->url('/admin')S>/pages/edit/<S $page->page_id S>">Edit</a> &raquo; <a onclick="return confirm('Are you sure? Remove all content of this page!');" href="/admin/pages/remove/<S $page->page_id S>">Remove</a>
							</p>
						</div>
					</li>
				<S /foreach S>
			</ul>

			
		</div>
  </div>
</div>
<script type="text/javascript">
//<![CDATA[
Sortable.create('items', { onUpdate:function(){ alert('ooo') } });
//]]>

//<![CDATA[
Sortable.create("items", {onUpdate:function(){new Ajax.Updater('flash', '/admin/pages/orderspage/<S $menu_home_list S>', {asynchronous:true, evalScripts:true, onComplete:function(request){new Effect.Highlight("items",{});}, parameters:Sortable.serialize("items")})}})
//]]>
</script>

<S include file="admin/elements/menu_right.tpl" S>