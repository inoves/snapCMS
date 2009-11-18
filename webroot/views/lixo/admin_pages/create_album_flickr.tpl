<div class="mypadding10 myborder mybkg_cz clearfix" >
	<S if $photos S>
		<form action="<S $helper->url('admin/create_album_flickr') S>" id="create_album_form" method="post">
			<p>
				<label>Title Gallery</label><br/>
				<input type="text" name="title" value="<S $post.title S>" id="title" class="title" style="width:580px;">
			</p><br/>
			<p>
				<label>Description Gallery</label><br/>
				<input type="text" name="description" value="<S $post.description S>" id="description" class="title"  style="width:580px;">
			</p>
			<p>
				<S foreach from=$photos.photos.photo item=photo S>
					<div class="mypadding10 mybkgbr" align="center" style="float:left; margin:10px;">
						<label>
							<img src="<S $flickr->buildPhotoURL($photo, 'square') S>"/><br/>
							<input type="radio" name="photo_id" value="<S $photo.id S>" >
						</label>
					</div>
				<S /foreach S>
			</p>
			<div class="clear"></div>
			<p>
				
				<a href="<S $helper->url('admin/create_album_flickr') S>" params="lightwindow_form=create_album_form" class="lightwindow_action" rel="submitForm"><button>Submit</button></a>
				
			</p>
		</form>
	
	<S else S>
		<h1>Not have photo(s) without gallery</h1>
	<S /if S>
</div>