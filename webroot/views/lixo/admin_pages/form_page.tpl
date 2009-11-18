<p><label>Title (<S $lang S>)<br/>
	<input name="page[<S $lang S>][title]" class="title txtarea" value="<S $page->title S>"/>
</label></p><br/>

<p><label>Intro (<S $lang S>)<br/>
	<textarea name="page[<S $lang S>][intro]" class="title txtarea height_txtarea"><S $page->intro S></textarea>
</label></p><br/>

<p><label>Content (<S $lang S>)<br/>
	<textarea name="page[<S $lang S>][content]" class="title txtarea height_txtarea"><S $page->content S></textarea>
</label></p><br/>
	<input type="hidden" name="page[<S $lang S>][id]" value="<S $page->id S>" id="id">
	<input type="hidden" name="page[<S $lang S>][language]" value="<S $lang S>" id="language">
	<input type="hidden" name="page[<S $lang S>][serial]" value="<S $page->serial S>" id="serial">

<fieldset>
	<legend>Config</legend>
	
	<p><label>Menu name (<S $lang S>)<br/>
		<input name="page[<S $lang S>][menu]" class="title txtarea" value="<S $page->menu S>"/>
	</label></p>

</fieldset>
