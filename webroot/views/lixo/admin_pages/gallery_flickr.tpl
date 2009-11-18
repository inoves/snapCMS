<br/>
<br/>

<div class="grid_3 mybkg_cz mypadding10" align="center">

	<img src="<S $flickr->buildPhotoURL($flickr->o_flickr->photos_getInfo($gallery.primary), 'thumbnail') S>"/>

</div>
<div class="grid_5">
	<span class="h3">Gallery:</span>(<a href="" class="a" onclick="$('#form_upload').slideToggle();">Upload photo</a>)<br/>
	<span class="h1"><S $gallery.title S></span><br/>
	<span class="txt"><S $photos.photoset.description S></span>
</div>
<div class="clear"></div>
<div class="grid_9 mybkg_cz mypadding10 clearfix" align="center">
	
	<S foreach from=$photos.photoset.photo item=photo S>
		
		<div class="mypadding10 mybkgbr" align="center" style="float:left; margin:10px;">
			<a href="<S $flickr->buildPhotoURL($photo, 'medium') S>" class="lightwindow" rel="[<S $gallery.title S>]"><img src="<S $flickr->buildPhotoURL($photo) S>" border="0"/><a/>
		</div>
		
	<S /foreach S>
	
</div>