<h1><S $title_action S></h1>
<form action="<S $helper->url('admin/') S><S $goto_action S>" method="post">
<S foreach from=$pages key=lang item=page S>
	<fieldset>
		<legend class="h2">Language: <S $lang S></legend>
		
		<S include file="admin/form_page.tpl" S>
		
	</fieldset>
<S /foreach S>

<br/>
<div><input type="submit" value="<S $value_button|default:"Submit" S>" class="submit"></div>
</form>
<br/>
<br/>