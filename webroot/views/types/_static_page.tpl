<div grid_12>
	
	<h1><S $page->descriptions('title') S></h1>
		<span>Home 
			<S foreach from=$page->menus() item=menu S>
				> <a href="<S$helper->url('/menu')S>/<S $menu->id S>/<S $menu->name S>"><S $menu->name S></a>
			<S /foreach S>
		</span><br><br>
		
		<div class="descriptions_intro">
			
			<p><S $page->descriptions('intro') S></p>
			
			<p><S $page->descriptions('content') S></p>
		
		</div>
		
		<div class="album_product">
			<S foreach name=arphotos from=$page->photos() item=photo S>
					<a href="#" ref="">
					<img src="<S $helper->url_photo($photo, 'quad') S>" class="intro_img"/>
					</a>
			<S /foreach S>
		</div>
		
		<div class="tags"><img src="<S$helper->url('/images/tag_pink.png')S>" corder="0"/> 
			<S foreach from=$page->tags() item=tag S>
				<a href="/tag/<S $tag->name S>"><S $tag->name S></a>
			<S /foreach S>
		</div>
		
		<div class="comments">

			<S foreach from=$page->comments item=comment S>
				<div class="comment">
					<div class="subject"><S $comment->subject S></div>
					<div class="author"><S $comment->user_id S></div>
					<div class="content"><S $comment->content S></div>
				</div>
			<S /foreach S>

		</div>
		<div class="clear"></div>
</div>
