<div class="grid_9">
	<div class="content_main">
		<h1><S $title_action S></h1>
		
		<div class="content">
			<S foreach from=$manufactures item=manufacture S>
				<div class="page" id="page_<S $manufacture->id S>">
					<h4><a href="<S $helper->url('/admin/pages/pages_list_manufacture/') S><S $manufacture->id S>"><S $manufacture->name S></a></h4>
						<a href="<S $helper->url('/admin/manufactures/edit/') S><S $manufacture->id S>">Edit</a>
						<a href="<S $helper->url('/admin/manufactures/remove/') S><S $manufacture->id S>" onclick="return confirm('Are you sure?');">Remove</a> 
				</div>
			<S /foreach S>
		</div>
	</div>
</div>

<div class="grid_3" >
	
	<div><a href="<S $helper->url('/admin/manufactures/manufacture_new') S>">New manufacture</a></div>
			
</div>