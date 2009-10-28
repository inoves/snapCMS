<form method="POST">
<div class="grid_9">

	
	<div class="content_main">
	  <h1><S $title_action S></h1>
		<div class="content">
				
				<S foreach from=$descriptions item=description S>
				
					<fieldset>
						<legend><img src="/images/flags/<S $description->lang S>.png"> <S $description->lang S></legend>
							<input type="hidden" name="description[<S $description->lang S>][page_id]" value="<S $description->page_id S>" id="id">
							<input type="hidden" name="description[<S $description->lang S>][lang]" value="<S $description->lang S>" id="language">
							<input type="hidden" name="description[<S $description->lang S>][serial]" value="<S $description->serial S>" id="serial">
							<p>
								<label>Title</label><br/>
								<input type="text" class="title" name="description[<S $description->lang S>][title]" value="<S $description->title S>" style="width: 630px;" />
							</p>

							<p>
								<label>Intro</label><br/>
								<textarea name="description[<S $description->lang S>][intro]" style="width: 630px;"><S $description->intro S></textarea>
							</p>

							<p>
								<label>Content</label><br/>
								<textarea name="description[<S $description->lang S>][content]" style="width: 630px;"><S $description->content S></textarea>
							</p>
					</fieldset>
				
				<S /foreach S>
				
				<div style="margin-top:20px;" >

					<input type="submit" name="Save" value="Save" class="button_save" >
					<input type="submit" name="Save" value="Save with track" class="button_save" >
					<S $helper->link_to('Cancel', 'admin/pages/pages_list') S>
				</div>
				
		</div>
	</div>
	
	<S if $page->id S>
	<div class="content_main" style="margin-top:10px;">
	  <h1>Gallery</h1>
			<table><tr><td>
		<div class="content" id="content_gallery">

			<S include file='admin/pages/_photos.tpl' S>

		</div>
			</td></tr></table>
	</div>
	<S /if S>
</div>




<div class="grid_3" >
		<h1>Page Attributes</h1>
		<p>
			<label><S $helper->checkbox('page[active]', $page->active, 1) S> Active</label>
		</p>
		<p>
			<label><S $helper->checkbox('page[show_home]', $page->show_home, 1) S> Show in home</label>
		</p>
		<p>
			<label><S $helper->checkbox('page[show_gallery]', $page->show_gallery, 1) S> Show gallery images</label>
		</p>
		<p>
			Template page name<br/>
			<select name="page[template_name]" style="width:180px;">
				<S foreach from=$templates_names item=template_name S>
					<S $helper->select_option($template_name, $template_name, $page->template_name) S>
				<S /foreach S>
			</select>
		</p>
		<p>
			Menu<br/>
		<select  name="page[menu_id]" style="width:180px;">
			<S foreach from=$containers item=container S>
				<S foreach from=$container->menus() item=fmenu S>
					<S $helper->select_option($fmenu->name, $fmenu->id, $page->menu_id , " - ") S>
						<S if $fmenu->menus() S>
							<S foreach from=$fmenu->menus() item=parent S>
<S $helper->select_option($parent->name, $parent->id, $page->menu_id , " -- ") S>
									<S if $parent->menus() S>
										<S foreach from=$parent->menus() item=parent_parent S>
<S $helper->select_option($parent_parent->name, $parent_parent->id, $page->menu_id , " --- ") S>
										<S /foreach S>
									<S /if S>
							<S /foreach S>
						<S /if S>

				<S /foreach S>
			<S /foreach S>
		</select>
		</p>
		<p>
			Tags. Separated by comma(,):<br/>
			<input name="tags" type="text" class="text" style="width:180px;" value="<S $page->find_tags() S>" />
		</p>
		<p>
			Increase or decrease order in home<br/>
			<select name="order_home">
				<S foreach from=$range item=ran S>
					<S $helper->select_option($ran, $ran, 0) S>
				<S /foreach S>
			</select>
		</p>
		<p>
			Increase or decrease order in menu<br/>
			<select name="order_menu">
				<S foreach from=$range item=ran S>
					<S $helper->select_option($ran, $ran, 0) S>
				<S /foreach S>
			</select>
		</p>
		<p>
			Created at: <S $page->created_at S><br/>
			Author: <S $page->author_name() S>
		</p>
		
		<h1>Product</h1>
		<p>
			<label><S $helper->checkbox('page[product]', $page->product, 1) S> Product</label>
		</p>
		<p>
			<label><S $helper->checkbox('product[promo_flag]', $product->promo_flag, 1) S> Promotion flag</label>
		</p>
		<p>
			<label><S $helper->checkbox('product[new_flag]', $product->new_flag, 1) S> New product flag</label>
		</p>
		<p>
			<label><S $helper->checkbox('product[show_old_price]', $product->show_old_price, 1) S> Show old price</label>
		</p>
		
		<p>
			Manufacture/Owner:<br/>
			<select style="width:180px;" name="product[manufacture_id]" id="product_manufacture_id">
				<S $helper->select_option('', 0, $product->manufacture_id) S>
				<S foreach from=$manufactures item=manufacture S>
					<S $helper->select_option($manufacture->name, $manufacture->id, $product->manufacture_id) S>
				<S /foreach S>
			</select>
			</p>
		
		<p>
			Reference:<br/>
			<input name="product[reference]" type="text" class="text" style="width:180px;" value="<S $product->reference S>" />
		</p>
		<p>
			Price:<br/>
			<input name="product[price]" type="text" class="text" style="width:180px;" value="<S $product->price S>" />
		</p>
		<p>
			Old price:<br/>
			<input name="product[old_price]" type="text" class="text" style="width:180px;" value="<S $product->old_price S>" />
		</p>
		<S if $page->id  S>
		<h1>Product Attributes</h1>
		<p>
			<select style="width:180px;" id="attrib_select">
				<S foreach from=$attributes item=attrib S>
					<S $helper->select_option($attrib->name, $attrib->id, 0) S>
				<S /foreach S>
			</select>
			<a href="/admin/pages/attributes/add/" onclick="add_attribute( $F('attrib_select') ); return false;"><img src="/images/add.png" border="0"></a>
		</p>
		<div id="attributes">
			<S foreach from=$product_attributes item=prod_att S>
				<div id="prod_att_<S $prod_att->id S>" class="prod_att">
					<a href="'/admin/pages/attributes/remove/'" onclick="rm_attribute(<S $prod_att->id S>); return false;"><img src="/images/delete.png" border="0" /></a>
					<S $prod_att->name S>
				</div>
			<S /foreach S>
		</div>
		<S /if S>
		
</div>
</form>

<div class="clear"></div>
<div class="grid_9" style="margin-top:10px;">
	
	<h1>Upload photo for gallery</h1>
	<div id="message"></div>
	<div class="bar_upload"></div>
	
	<form class="form_upload" 
		action="/admin/pages/upload/<S $page->id S>" 
		target="iframe_upload" 
		onsubmit="upload_file()" 
		method="post" 
		enctype="multipart/form-data" 
		id="form_upload">
	
	Select photo:
	<input type="file" name="photo">
	<input type="text" name="photo_desc">
	<input type="submit" name="button" value="Upload" id="upload_button">
	
	</form>
	
	<div id="message"></div>
	<iframe id="iframe_upload" name="iframe_upload"></iframe>
</div>

<script type="text/javascript" charset="utf-8">
	var url = '';
	function rm_photo(photo_id){
		if(confirm('Are you sure?')){
			new Ajax.Updater('content_gallery', '/admin/pages/rm_photo/'+photo_id);
		}
	}
	function rm_attribute(id){
		if(confirm('Are you sure?')){
			url = '/admin/pages/attributes/remove/<S $page->id S>/'+id;
			ajax_attrib();
		}
	}
	function add_attribute(id){
		url = '/admin/pages/attributes/add/<S $page->id S>/'+id;
		ajax_attrib();
	}
	function ajax_attrib(){
		$('attributes').innerHTML = 'Waiting...';
		new Ajax.Updater('attributes', url);
	}
	function upload_file(){
		$("message").update("Waiting, sending file...");
		$('upload_button').disable();
	}
	function closeIframe(message) {  
		$("message").update("Send with success: " + message);
		$('upload_button').enable();
		$('form_upload').reset();
		new Ajax.Updater('content_gallery', '/admin/pages/photos/<S $page->id S>');
	}
	<S if !$page->id S>
	$('form_upload').disable();
	<S /if S>
</script>