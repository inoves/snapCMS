<br/><br/><br/>
<span class="h1">Galleries Flickr</span> (<a href="<S $helper->url('admin/create_album_flickr') S>?<S $helper->rand() S>"
 title="New gallery"
 class="lightwindow a"
 params="lightwindow_width=630,lightwindow_height=400,lightwindow_type=page">New Gallery</a>)<br/>
<br/><br/>
<div class="clearfix mybkg_cz mypadding10">
	<S foreach from=$galleries.photoset item=gal S>
		<div class="grid_2" align="center">
			<a href="<S $flickr->buildPhotoURL($flickr->o_flickr->photos_getInfo($gal.primary), 'medium') S>"
				 	class="lightwindow" 
					rel="[<S $gal.title S>]" >
				<img src="<S $flickr->buildPhotoURL($flickr->o_flickr->photos_getInfo($gal.primary)) S>"/>
			</a>
			<br/>
			<a href="<S $helper->url('admin/gallery_flickr/') S><S $gal.id S>" class="a">
				<S $gal.title S>
			</a><br/>
			<!--span style="display:none;"-->
				
				<S foreach from=$gal.myphotos.photoset.photo item=photo S>
					<S if $gal.primary ne $photo.id S>
<a 		href="<S $flickr->buildPhotoURL($photo, 'medium') S>"
	 	class="lightwindow" 
		rel="[<S $gal.title S>]" ></a>
					<S /if S>
				<S /foreach S>
					
			<!--/span-->
			
			<span class="txt">(<S $gal.photos S>)</span><br/><br/>
		</div>
	<S/foreach S>
</div>
