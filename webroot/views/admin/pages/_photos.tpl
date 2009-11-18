<S foreach from=$photos item=photo S>
<div id="photo_<S $photo->id S>" class="grid_1 photo" onMouseOut="$('tool_photo_<S $photo->id S>').hide()" onmouseover="$('tool_photo_<S $photo->id S>').show()">
	<div  style="margin-top:3px;float:left;width:60px;height:60px; background-image: url('<S $helper->url_photo($photo, 'quad') S>'); ">

		<div style="float:right;display:none;position:relative;z-index:2px;left:0px;top:0px;" id="tool_photo_<S $photo->id S>">
			<a href="/admin/" onclick="rm_photo('<S $photo->id S>'); return false;" alt="Remove photo"><img src="/images/delete.png" alt="Remove photo"/></a>
		</div>
	</div>
</div>
<S /foreach S>