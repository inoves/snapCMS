<div class="grid_4 alpha">
	<div class="first_photo">
		<a href="#" ref="">
		<img src="<S $helper->url_photo($page->photo(0), 'medium') S>" width="210" class="intro_img"/>
		</a>
	</div>
	<div class="album_product">
		<S foreach name=arphotos from=$page->photos() item=photo S>
				<a href="#" ref="">
				<img src="<S $helper->url_photo($photo, 'quad') S>" class="intro_img"/>
				</a>
		<S /foreach S>
	</div>
	<div class="clear"></div>
</div>


<!--Static Produtc-->
<div class="grid_8 omega">
	<h1><S $page->descriptions('title') S></h1>
		<span>Home 
			<S foreach from=$page->menus() item=menu S>
				> <a href="<S$helper->url('/menu')S>/<S $menu->id S>/<S $menu->name|replace:'/':'-'|replace:' ':'_'|urlencode S>"><S $menu->name S></a>
			<S /foreach S>
		</span><br><br>
	<div class="descriptions_intro">
		
		<S $page->descriptions('intro') S>
		<S if $page->manufacture('name') != '' S>
			<div class="manufacture">
				<S $language.manufacture S> <a href="<S$helper->url('/manufacture')S>/<S $page->manufacture('id') S>/<S $page->manufacture('name')|replace:'/':'-'|replace:' ':'_'|urlencode S>"><S $page->manufacture('name') S></a>
			</div>
		<S /if S>
		
		<div class="currency">
			<S if $page->product('show_old_price')==1 S>
				<span class="old_price"><S $language.currency S> <S $page->old_price() S></span>
				<br/>
			<S /if S>
			<strong><S $language.currency S> <S$page->price()S></strong>
		</div>
		
	</div>
	
	<div class="lbl_buy_product">
		
		<S if $page->product('promo_flag') == 1 S>
			<img src="<S$helper->url('/images/award_star_gold_2.png')S>" corder="0"/>
		<S /if S>
		<S if $page->product('new_flag') == 1 S>
			<img src="<S$helper->url('/images/new.png')S>" corder="0"/>
		<S /if S>
		<S if $page->product_attributes() S>
			<select id="prod_attrib">
				<S foreach from=$page->product_attributes() item=attrib S>
					<S $helper->select_option($attrib->name, $attrib->id, 0) S>
				<S /foreach S>
			</select>
		<S /if S>
		<a href="<S $helper->url('/store/add') S>/<S $page->id S>/" onclick="this.href=this.href+$F('prod_attrib'); return true;">
			<img src="<S$helper->url('/images/cart.png')S>" corder="0"/><S $language.buy S>
		</a>
		
	</div>
</div>


<div class="clear"></div>
<div class="content"><S $page->descriptions('content') S></div>
<div class="clear"></div>
<div class="tags"><img src="<S$helper->url('/images/tag_pink.png')S>" corder="0"/> 
	<S foreach from=$page->tags() item=tag S>
		<a href="/tag/<S $tag->name S>"><S $tag->name S></a>
	<S /foreach S>
</div>



<div class="comments">
	<S if $page->comments S>
		<div class="lbl"><S $language.comments S></div>
		<S foreach from=$page->comments item=comment S>
			<div class="comment">
				<div class="subject"><S $comment->subject S></div>
				<div class="author"><S $comment->user_id S></div>
				<div class="content"><S $comment->content S></div>
			</div>
		<S /foreach S>
	<S /if S>
</div>
<div class="clear"></div>
<div class="intro">
	<S if $similar S>
		<div class="lbl"><S $language.similar S></div>
		<S foreach from=$similar item=page S>
				<div class="grid_3 <S cycle values="alpha,,,omega" S>">
					<S include file="types/_intro_product.tpl" S>
				</div>
		<S /foreach S>
	<S /if S>
</div>
<!--End Static Producto-->
