<div class="grid_9">
	<div class="content_main">
		<h1><S $title_action S></h1>
		
		<div class=" grid_4">
			<form action="" method="POST" accept-charset="utf-8" method="post" enctype="multipart/form-data">
					
					<p>
					<label for="name">Name</label><br/>
					<input type="text" name="manufacture[name]" value="<S $manufacture->name S>" id="name" class="title">
					</p>
					
					<p>
					<label for="description">Description</label><br/>
					<input type="text" name="manufacture[description]" value="<S $manufacture->description S>" id="description" class="title">
					</p>
					<p>
					<label for="site">Site</label><br/>
					<input type="text" name="manufacture[site]" value="<S $manufacture->site S>" id="site" class="title">
					</p>
					<p><label for="image">Image/logo</label><br/>
						<input type="file" name="image" id="image"><br>
						<input type="checkbox" name="remove_image" value="true" id="remove_image">
						<label for="remove_image">Remove image</label>
					</p>
					
					<p>
						<input type="submit" name="Save" value="Save" class="button_save" > - 
						<a href="<S $helper->url('/admin/manufactures') S>">Back</a>
					</p>
					
			</form>
			
		</div>
		<div class="grid_4">
			<S if $manufacture->image != ''  S>
				<S $helper->img($manufacture->url_image('medium')) S>
			<S /if S>
		</div>
		<div class="clear"></div>
	</div>
</div>