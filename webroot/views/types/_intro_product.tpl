<!--Intro-->
	<div class="background_intro_1" id="_intro<S $page->id S>">
		<div class="background_intro_2">
			<div class="background_intro_3">
				<div class="intro_title">
					<!--h2-->
						<a href="<S $helper->url('/page') S>/<S $page->id S>/<S $page->descriptions('title')|replace:'/':'-'|replace:' ':'_'|urlencode S>">
							<span><S $page->descriptions('title')|truncate:17:"...":true S></span>
						</a>
				</div>
				<p>
					<S if $page->descriptions('intro') S>
						<S $page->descriptions('intro')|strip_tags|truncate:120:"...":true S>
					<S else S>
						<S $page->descriptions('content')|strip_tags|truncate:120:"...":true S>
					<S /if S>
				</p>
				
				<div class="intro_photo">
					<img src="<S $helper->url_photo($page->photo(0), 'quad') S>" class="intro_img"/>
				</div>
				
				<div class="currency">
					<S if $page->product('show_old_price')==1 S>
						<span class="old_price"><S $language.currency S> <S$page->old_price()S></span>
						<!--br/>
						<span class="discount"><S $language.currency S> <S$page->old_price()S></span--><br/>
					<S /if S>
					
					<strong><S $language.currency S> <S$page->price()S></strong>
				</div>
				<div class="clear"></div>
				<div class="lbl_buy">
					
					<S if $page->product('promo_flag') == 1 S>
						<img src="<S$helper->url('/images/award_star_gold_2.png')S>" corder="0"/>
					<S /if S>
					<S if $page->product('new_flag') == 1 S>
						<img src="<S$helper->url('/images/new.png')S>" corder="0"/>
					<S /if S>

					<a href="<S$helper->url('/store/add')S>/<S $page->id S>">
						<img src="<S$helper->url('/images/cart.png')S>" corder="0"/><S $language.buy S>
					</a>
				</div>
			</div>
		</div>
	</div>